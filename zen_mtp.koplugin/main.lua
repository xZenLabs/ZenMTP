local Device = require("device")
if not Device:isKindle() then
    return { disabled = true, }
end

local ConfirmBox = require("ui/widget/confirmbox")
local DataStorage = require("datastorage")
local Dispatcher = require("dispatcher")
local Event = require("ui/event")
local InfoMessage = require("ui/widget/infomessage")
local LuaSettings = require("luasettings")
local UIManager = require("ui/uimanager")
local WidgetContainer = require("ui/widget/container/widgetcontainer")
local ffiUtil = require("ffi/util")
local lfs = require("libs/libkoreader-lfs")
local logger = require("logger")
local util = require("util")
local _ = require("gettext")
local T = ffiUtil.template

-- Fix: autosuspend _schedule_kindle else branch passes negative delay to
-- scheduleIn when kindle_t1_reset_seconds <= 0 and suspend_delay_seconds <= 0.
-- Instead of replacing the function, we wrap it: temporarily guard scheduleIn
-- only during _schedule_kindle, intercept the negative delay, and reset t1 +
-- reschedule for the full period. The original function logic is unchanged.
-- This runs during ZenMTP's require phase, before autosuspend's init().
if Device:isKindle() then
    local ok, AutoSuspend = pcall(require, "plugins/autosuspend.koplugin/main")
    if ok and AutoSuspend and AutoSuspend._schedule_kindle then
        local _orig_schedule_kindle = AutoSuspend._schedule_kindle
        local PowerD = require("device"):getPowerDevice()
        local default_t1 = 4 * 60

        AutoSuspend._schedule_kindle = function(self)
            local _orig_si = UIManager.scheduleIn
            UIManager.scheduleIn = function(si_self, seconds, action, ...)
                UIManager.scheduleIn = _orig_si
                if type(seconds) == "number" and seconds < 0 then
                    logger.warn("AutoSuspend: _schedule_kindle negative t1 delay, resetting t1")
                    PowerD:resetT1Timeout()
                    self.last_t1_reset_time = UIManager:getElapsedTimeSinceBoot()
                    return _orig_si(si_self, default_t1, action, ...)
                end
                return _orig_si(si_self, seconds, action, ...)
            end
            _orig_schedule_kindle(self)
            UIManager.scheduleIn = _orig_si
        end

        logger.info("ZenMTP: patched AutoSuspend._schedule_kindle (negative t1 delay guard)")
    end
end

local PAYLOAD_DIR_NAME = "ZenMTP"
local TARGET_DIR = "/mnt/us/documents/" .. PAYLOAD_DIR_NAME
local TARGET_SCRIPT = TARGET_DIR .. "/ZenMTP.sh"
local TARGET_IMAGE = TARGET_DIR .. "/zen.png"
local TARGET_SIGNATURE_FILE = TARGET_DIR .. "/.zenmtp_payload_signature"
local DAEMON_PAYLOAD_DIR_NAME = ".ZenMTP"
local DAEMON_TARGET_DIR = "/mnt/us/.ZenMTP"
local DAEMON_TARGET_SCRIPT = DAEMON_TARGET_DIR .. "/zen_mtpd.sh"
local BUNDLED_SCRIPT_NAME = "ZenMTP.sh"
local BUNDLED_IMAGE_NAME = "zen.png"
local BUNDLED_DAEMON_NAME = "zen_mtpd.sh"
local SETTINGS_FILE = DataStorage:getSettingsDir() .. "/zenmtp.lua"
local RESTORE_FL_STATE_FILE = "/tmp/zenmtp_fl_ko"

local install_error_notified = false

local function shellQuote(str)
    return "'" .. tostring(str):gsub("'", "'\\''") .. "'"
end

local function ensureActiveWidget(ui, widget)
    if not ui or type(ui.active_widgets) ~= "table" then
        return false
    end
    for _, active in ipairs(ui.active_widgets) do
        if active == widget then
            return true
        end
    end
    table.insert(ui.active_widgets, widget)
    return true
end

local function removeActiveWidget(ui, widget)
    if not ui or type(ui.active_widgets) ~= "table" then
        return
    end
    for idx = #ui.active_widgets, 1, -1 do
        if ui.active_widgets[idx] == widget then
            table.remove(ui.active_widgets, idx)
        end
    end
end

local function ensureExecutable(path)
    os.execute("chmod 755 " .. shellQuote(path) .. " >/dev/null 2>&1")
end

local function captureFrontlightStateForRestore()
    local ok, power_device = pcall(function() return Device:getPowerDevice() end)
    if not ok or not power_device then
        logger.warn("ZenMTP: cannot capture fl state; no PowerDevice")
        return false
    end

    local intensity = nil
    local warmth = nil

    if power_device.frontlightIntensity then
        local intensity_ok, value = pcall(power_device.frontlightIntensity, power_device)
        if intensity_ok then
            intensity = tonumber(value)
        end
    end
    if not intensity then
        intensity = tonumber(power_device.fl_intensity)
    end

    if power_device.frontlightWarmth then
        local warmth_ok, value = pcall(power_device.frontlightWarmth, power_device)
        if warmth_ok then
            warmth = tonumber(value)
        end
    end
    if warmth == nil then
        warmth = tonumber(power_device.fl_warmth)
    end

    local state_file = io.open(RESTORE_FL_STATE_FILE, "wb")
    if not state_file then
        logger.warn("ZenMTP: cannot write fl restore state:", RESTORE_FL_STATE_FILE)
        return false
    end
    state_file:write(tostring(intensity or ""), "\n")
    state_file:write(tostring(warmth or ""), "\n")
    state_file:close()

    logger.dbg("ZenMTP: captured fl state intensity=", intensity or "nil", " warmth=", warmth or "nil")
    return true
end

local function readCapturedFrontlightState()
    local state_file = io.open(RESTORE_FL_STATE_FILE, "r")
    if not state_file then
        return nil, nil
    end

    local intensity = tonumber(state_file:read("*l"))
    local warmth = tonumber(state_file:read("*l"))
    state_file:close()
    os.remove(RESTORE_FL_STATE_FILE)
    return intensity, warmth
end

local function isAbsolutePath(path)
    return type(path) == "string" and path:sub(1, 1) == "/"
end

local function copyFileFallback(source_path, dest_path)
    local source_file = io.open(source_path, "rb")
    if not source_file then
        return nil
    end

    local payload_data = source_file:read("*all")
    source_file:close()

    local dest_file = io.open(dest_path, "wb")
    if not dest_file then
        return nil
    end

    dest_file:write(payload_data or "")
    dest_file:close()
    return true
end

local function copyFileRobust(source_path, dest_path)
    if ffiUtil.copyFile(source_path, dest_path) then
        return true
    end

    return copyFileFallback(source_path, dest_path)
end

local function copyTree(src, dst)
    local ok_mkdir, mkdir_err = util.makePath(dst)
    if not ok_mkdir then
        return nil, mkdir_err
    end

    local ok, iter, dir_obj = pcall(lfs.dir, src)
    if not ok then
        return nil, T(_("Cannot open bundled payload directory:\n%1"), src)
    end

    for entry in iter, dir_obj do
        if entry ~= "." and entry ~= ".." then
            local source_path = src .. "/" .. entry
            local dest_path = dst .. "/" .. entry
            local mode = lfs.attributes(source_path, "mode")

            if mode == "directory" then
                local copied, copy_err = copyTree(source_path, dest_path)
                if not copied then
                    return nil, copy_err
                end
            elseif mode == "file" then
                local copied = copyFileRobust(source_path, dest_path)
                if not copied then
                    return nil, T(
                        _("Failed to copy payload file:\n%1\nTo:\n%2\nCWD:\n%3"),
                        source_path,
                        dest_path,
                        lfs.currentdir() or "unknown"
                    )
                end
            end
        end
    end

    return true
end

local function payloadInstalledCompletely()
    if lfs.attributes(TARGET_DIR, "mode") ~= "directory" then
        return false
    end
    if lfs.attributes(DAEMON_TARGET_DIR, "mode") ~= "directory" then
        return false
    end

    return lfs.attributes(TARGET_SCRIPT, "mode") == "file"
        and lfs.attributes(TARGET_IMAGE, "mode") == "file"
        and lfs.attributes(DAEMON_TARGET_SCRIPT, "mode") == "file"
end

local function stableDigest(data)
    local hash_value = 0
    for idx = 1, #data do
        hash_value = (hash_value * 131 + data:byte(idx)) % 2147483647
    end

    return string.format("%d:%d", hash_value, #data)
end

local function fileDigest(path)
    local file_handle = io.open(path, "rb")
    if not file_handle then
        return nil
    end

    local contents = file_handle:read("*all")
    file_handle:close()
    if not contents then
        return nil
    end

    return stableDigest(contents)
end

local function bundledPayloadSignature(bundled_dir)
    local script_path = bundled_dir .. "/" .. BUNDLED_SCRIPT_NAME
    local image_path = bundled_dir .. "/" .. BUNDLED_IMAGE_NAME
    local daemon_bundled_dir = bundled_dir:gsub("/" .. PAYLOAD_DIR_NAME .. "$", "/" .. DAEMON_PAYLOAD_DIR_NAME)
    local daemon_path = daemon_bundled_dir .. "/" .. BUNDLED_DAEMON_NAME

    local script_digest = fileDigest(script_path)
    if not script_digest then
        return nil, T(_("Cannot hash bundled payload file:\n%1"), script_path)
    end

    local image_digest = fileDigest(image_path)
    if not image_digest then
        return nil, T(_("Cannot hash bundled payload file:\n%1"), image_path)
    end

    local daemon_digest = fileDigest(daemon_path)
    if not daemon_digest then
        return nil, T(_("Cannot hash bundled payload file:\n%1"), daemon_path)
    end

    return script_digest .. "|" .. image_digest .. "|" .. daemon_digest
end

local function readInstalledPayloadSignature()
    local marker_file = io.open(TARGET_SIGNATURE_FILE, "rb")
    if not marker_file then
        return nil
    end

    local marker = marker_file:read("*l")
    marker_file:close()
    return marker
end

local function writeInstalledPayloadSignature(signature)
    local marker_file = io.open(TARGET_SIGNATURE_FILE, "wb")
    if not marker_file then
        return nil
    end

    marker_file:write(signature or "")
    marker_file:write("\n")
    marker_file:close()
    return true
end

local ZenMTP = WidgetContainer:extend{
    name = "zen_mtp",
    is_doc_only = false,
    -- Needed so dispatcher/gesture events reliably reach this plugin.
    is_always_active = true,
    confirm_before_run = true,
    settings = nil,
    settings_dirty = false,
}

function ZenMTP:onDispatcherRegisterActions()
    logger.dbg("ZenMTP: registering dispatcher action zenmtp_switch_to_mtp")
    Dispatcher:registerAction(
        "zenmtp_switch_to_mtp",
        {
            category = "none",
            event = "ZenMTPSwitch",
            title = _("Zen MTP"),
            general = true,
        }
    )
end

function ZenMTP:getBundledPayloadDir()
    local relative_path = self.path .. "/payload/" .. PAYLOAD_DIR_NAME
    if lfs.attributes(relative_path, "mode") == "directory" then
        return relative_path
    end

    if not isAbsolutePath(relative_path) then
        local data_dir = DataStorage:getDataDir()
        if data_dir then
            local data_dir_path = data_dir .. "/" .. relative_path
            if lfs.attributes(data_dir_path, "mode") == "directory" then
                return data_dir_path
            end
        end

        local cwd = lfs.currentdir()
        if cwd then
            local cwd_path = cwd .. "/" .. relative_path
            if lfs.attributes(cwd_path, "mode") == "directory" then
                return cwd_path
            end
        end
    end

    return relative_path
end

function ZenMTP:ensurePayloadInstalled()
    local bundled_dir = self:getBundledPayloadDir()
    if lfs.attributes(bundled_dir, "mode") ~= "directory" then
        return nil, T(_("Bundled payload not found:\n%1"), bundled_dir)
    end

    local signature, signature_err = bundledPayloadSignature(bundled_dir)
    if not signature then
        return nil, signature_err or _("Failed to determine bundled payload signature.")
    end

    local hash_changed = false
    local installed_signature = nil

    if payloadInstalledCompletely() then
        installed_signature = readInstalledPayloadSignature()
        if installed_signature == signature then
            return true
        end

        if installed_signature and installed_signature ~= "" and installed_signature ~= signature then
            hash_changed = true
            logger.warn("ZenMTP: payload hash changed; reinstalling payload. old=", installed_signature, " new=", signature)
        end
    end

    local copied, copy_err = copyTree(bundled_dir, TARGET_DIR)
    if not copied then
        return nil, copy_err or _("Failed to install Zen MTP payload.")
    end

    -- Deploy daemon from its own payload dir
    local daemon_bundled_dir = bundled_dir:gsub("/" .. PAYLOAD_DIR_NAME .. "$", "/" .. DAEMON_PAYLOAD_DIR_NAME)
    local daemon_copied, daemon_copy_err = copyTree(daemon_bundled_dir, DAEMON_TARGET_DIR)
    if not daemon_copied then
        return nil, daemon_copy_err or _("Failed to install Zen MTP daemon payload.")
    end

    ensureExecutable(TARGET_SCRIPT)
    ensureExecutable(DAEMON_TARGET_SCRIPT)

    if not writeInstalledPayloadSignature(signature) then
        logger.warn("ZenMTP: failed to write payload signature marker:", TARGET_SIGNATURE_FILE)
    end

    if hash_changed then
        logger.warn("ZenMTP: payload reinstalled after hash change. old=", installed_signature, " new=", signature)
    end

    return true
end

function ZenMTP:notifyInstallError(err)
    if install_error_notified then
        return
    end

    install_error_notified = true
    UIManager:show(InfoMessage:new{
        text = _("Zen MTP payload installation failed.") .. "\n\n" .. (err or _("Unknown error.")),
        icon = "notice-warning",
    })
end

function ZenMTP:init()
    if not self.settings then
        self.settings = LuaSettings:open(SETTINGS_FILE)
    end

    os.remove("/tmp/zenmtp_restore_needed")
    os.execute("touch /tmp/zenmtp_splash.stop 2>/dev/null")
    os.execute("eips -c 2>/dev/null")

    logger.dbg("ZenMTP: init")
    logger.dbg("ZenMTP: ui context fm=", self.ui and self.ui.file_chooser and "1" or "0",
        " reader=", self.ui and self.ui.document and "1" or "0")
    if ensureActiveWidget(self.ui, self) then
        logger.dbg("ZenMTP: registered as active widget")
    else
        logger.warn("ZenMTP: could not register as active widget")
    end

    -- Restore frontlight only when KOReader was launched by our daemon
    -- after MTP disconnect. Skip on normal launches so other plugins
    -- (e.g. schedule-based brightness) are not overridden.
    local fl_br_file = io.open("/tmp/zenmtp_fl_br", "r")
    if fl_br_file then
        -- This file is our "returning from ZenMTP daemon" marker.
        -- Consume it immediately so normal launches won't be treated as restores.
        fl_br_file:close()
        os.remove("/tmp/zenmtp_fl_br")

        UIManager:scheduleIn(1, function()
            local ok, power_device = pcall(function() return Device:getPowerDevice() end)
            if not ok or not power_device then
                logger.warn("ZenMTP: cannot get PowerDevice")
                return
            end

            local restore_intensity, restore_warmth = readCapturedFrontlightState()

            if restore_intensity == nil or restore_warmth == nil then
                local reader_settings = rawget(_G, "G_reader_settings")
                if reader_settings and reader_settings.readSetting then
                    restore_intensity = restore_intensity or tonumber(reader_settings:readSetting("frontlight_intensity"))
                    restore_warmth = restore_warmth or tonumber(reader_settings:readSetting("frontlight_warmth"))
                end
            end

            if restore_intensity and restore_intensity > 0 and power_device.setIntensity then
                local changed = false
                local set_intensity_ok, result = pcall(power_device.setIntensity, power_device, restore_intensity)
                if set_intensity_ok and result then
                    changed = true
                end

                -- If cached KOReader state already matches, setIntensity() returns false
                -- and won't touch hardware. Force-apply hardware in that case.
                if not changed and power_device.setIntensityHW then
                    local norm_intensity = restore_intensity
                    if power_device.normalizeIntensity then
                        local normalize_intensity_ok, normalized = pcall(power_device.normalizeIntensity, power_device, restore_intensity)
                        if normalize_intensity_ok and normalized then
                            norm_intensity = normalized
                        end
                    end
                    local set_intensity_hw_ok = pcall(power_device.setIntensityHW, power_device, norm_intensity)
                    if set_intensity_hw_ok then
                        power_device.fl_intensity = norm_intensity
                        if power_device.stateChanged then
                            pcall(power_device.stateChanged, power_device)
                        end
                        logger.dbg("ZenMTP: fl hw forced intensity=", norm_intensity)
                    end
                end
                logger.dbg("ZenMTP: fl widget init intensity=", restore_intensity)
            else
                logger.dbg("ZenMTP: frontlight_intensity missing/invalid, skipping intensity restore")
            end

            if restore_warmth and restore_warmth >= 0 and power_device.setWarmth then
                -- force_setting=true: always apply warmth to hardware on restore.
                pcall(power_device.setWarmth, power_device, restore_warmth, true)
                logger.dbg("ZenMTP: fl widget init warmth=", restore_warmth)
            end

            if power_device.beforeSuspend and not power_device._zenmtp_bs_wrapped then
                local _orig = power_device.beforeSuspend
                power_device.beforeSuspend = function(self, ...)
                    os.execute("for b in /sys/class/backlight/*/brightness; do [ -w \"$b\" ] && echo 0 > \"$b\" 2>/dev/null; done")
                    return _orig(self, ...)
                end
                power_device._zenmtp_bs_wrapped = true
            end
        end)
    else
        logger.dbg("ZenMTP: not a daemon restore launch, skipping fl init")
    end

    self:onDispatcherRegisterActions()

    local confirm_setting = self.settings:readSetting("confirm_before_run")
    self.confirm_before_run = confirm_setting == nil and true or confirm_setting

    if self.ui and self.ui.menu then
        self.ui.menu:registerToMainMenu(self)
    end

    local installed, install_err = self:ensurePayloadInstalled()
    if not installed then
        logger.warn("ZenMTP: payload install failed:", install_err or "unknown")
        UIManager:nextTick(function()
            self:notifyInstallError(install_err)
        end)
    end
end

function ZenMTP:onCloseWidget()
    removeActiveWidget(self.ui, self)
end

function ZenMTP:onFlushSettings()
    if self.settings and self.settings_dirty then
        self.settings:flush()
        self.settings_dirty = false
    end
end

function ZenMTP:runScript()
    local installed, install_err = self:ensurePayloadInstalled()
    if not installed then
        return nil, install_err
    end

    if lfs.attributes(TARGET_SCRIPT, "mode") ~= "file" then
        return nil, T(_("Zen MTP script is missing:\n%1"), TARGET_SCRIPT)
    end

    ensureExecutable(TARGET_SCRIPT)
    captureFrontlightStateForRestore()
    local command = "(ZENMTP_KOREADER_HANDOFF=1 setsid sh " .. shellQuote(TARGET_SCRIPT) .. " </dev/null >/dev/null 2>&1 &) 2>/dev/null || "
        .. "(ZENMTP_KOREADER_HANDOFF=1 nohup sh " .. shellQuote(TARGET_SCRIPT) .. " </dev/null >/dev/null 2>&1 &) 2>/dev/null || "
        .. "(ZENMTP_KOREADER_HANDOFF=1 sh " .. shellQuote(TARGET_SCRIPT) .. " </dev/null >/dev/null 2>&1 &)"
    local status = os.execute(command)

    if status == 0 or status == true then
        return true
    end

    return nil, _("Failed to launch Zen MTP script.")
end

function ZenMTP:handoffToSystemMTPUI()
    UIManager:broadcastEvent(Event:new("Close"))
    UIManager:nextTick(function()
        UIManager:quit(86)
    end)
end

function ZenMTP:executeSwitch()
    logger.dbg("ZenMTP: executeSwitch")
    local ok, err = self:runScript()
    if not ok then
        logger.warn("ZenMTP: executeSwitch failed:", err or "unknown")
        UIManager:show(InfoMessage:new{
            text = _("Zen MTP could not start.") .. "\n\n" .. (err or _("Unknown error.")),
            icon = "notice-warning",
        })
        return true
    end

    self:handoffToSystemMTPUI()
    return true
end

function ZenMTP:onZenMTPSwitch()
    logger.dbg("ZenMTP: onZenMTPSwitch received")
    if self.confirm_before_run then
        UIManager:show(ConfirmBox:new{
            text = _("Switch Kindle to MTP mode now?"),
            ok_text = _("Switch"),
            ok_callback = function()
                self:executeSwitch()
            end,
        })
        return true
    end

    return self:executeSwitch()
end

function ZenMTP:onZenMTPInstallPayload()
    local installed, err = self:ensurePayloadInstalled()
    if installed then
        UIManager:show(InfoMessage:new{
            text = _("Zen MTP payload is ready in /mnt/us/documents/ZenMTP."),
            timeout = 2,
        })
    else
        UIManager:show(InfoMessage:new{
            text = _("Zen MTP payload installation failed.") .. "\n\n" .. (err or _("Unknown error.")),
            icon = "notice-warning",
        })
    end

    return true
end

function ZenMTP:toggleConfirmBeforeRun()
    self.confirm_before_run = not self.confirm_before_run
    self.settings:saveSetting("confirm_before_run", self.confirm_before_run)
    self.settings_dirty = true
end

function ZenMTP:getSettingsSubItemTable()
    return {
        {
            text = _("Switch to MTP mode"),
            callback = function()
                self:onZenMTPSwitch()
            end,
        },
        {
            text = _("Install to Kindle"),
            keep_menu_open = true,
            callback = function()
                self:onZenMTPInstallPayload()
            end,
            separator = true,
        },
        {
            text = _("Ask confirmation"),
            checked_func = function()
                return self.confirm_before_run
            end,
            callback = function()
                self:toggleConfirmBeforeRun()
            end,
        },
    }
end

function ZenMTP:addToMainMenu(menu_items)
    menu_items.network_zenmtp = {
        text = _("Zen MTP"),
        sorting_hint = "network",
        checked_func = function()
            return false
        end,
        callback = function()
            self:onZenMTPSwitch()
        end,
        sub_item_table = self:getSettingsSubItemTable(),
    }

    menu_items.zen_mtp = {
        text = _("Zen MTP"),
        sorting_hint = "more_tools",
        callback = function()
            self:onZenMTPSwitch()
        end,
    }
end

return ZenMTP
