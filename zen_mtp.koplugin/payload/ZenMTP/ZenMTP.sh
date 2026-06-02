#!/bin/sh
# Name: ZenMTP
# Author: Anthony Gress
# Icon: data:image/png;base64,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
# Created: 2026-05-14
# Version: 1.6
# Description: Switches Kindle to MTP mode for file transfer and returns to koreader if applicable

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SPLASH="$SCRIPT_DIR/zen.png"
LOG_FILE="/tmp/zenmtp.log"
EIPS_BIN="$(command -v eips 2>/dev/null || true)"
SPLASH_STOP_FILE="/tmp/zenmtp_splash.stop"
SPLASH_PID_FILE="/tmp/zenmtp_splash.pid"
ZENMTP_RESTORE_FLAG="/tmp/zenmtp_restore_needed"
ZENMTP_SETUP_DONE_FLAG="/tmp/zenmtp_setup_done"
ZENMTP_MAIN_PID_FILE="/tmp/zenmtp_main.pid"
UPSTART_DAEMON_CONF="/etc/upstart/zenmtp-daemon.conf"
DAEMON_LOCK_FILE="/tmp/zenmtp_daemon.lock"
DAEMON_SCRIPT="/mnt/us/.ZenMTP/zen_mtpd.sh"
DAEMON_VERSION="14"
GDIR="/sys/kernel/config/usb_gadget/mtpgadget"
UDC_HW="$(ls /sys/class/udc/ 2>/dev/null | head -1)"

# ============================================================
# Logging
# ============================================================

log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') $*" >> "$LOG_FILE"
}

log_cmd() {
    label="$1"
    shift
    out="$("$@" 2>&1)"
    rc=$?
    if [ -n "$out" ]; then
        log "$label rc=$rc out=$out"
    else
        log "$label rc=$rc out=<none>"
    fi
}

log_job_status() {
    job_name="$1"
    status_out="$(initctl status "$job_name" 2>&1)"
    rc=$?
    log "job $job_name status rc=$rc out=$status_out"
}

job_is_running() {
    job_name="$1"
    initctl status "$job_name" 2>/dev/null | grep -q "start/running"
}

wait_for_job_state() {
    job_name="$1"
    want_state="$2"
    timeout_secs="$3"
    elapsed=0
    while [ "$elapsed" -lt "$timeout_secs" ]; do
        if [ "$want_state" = "running" ] && job_is_running "$job_name"; then
            log "wait_for_job_state $job_name reached running at ${elapsed}s"
            return 0
        fi
        if [ "$want_state" = "stopped" ] && ! job_is_running "$job_name"; then
            log "wait_for_job_state $job_name reached stopped at ${elapsed}s"
            return 0
        fi
        sleep 1
        elapsed=$((elapsed + 1))
    done
    log "wait_for_job_state timeout job=$job_name want=$want_state timeout=${timeout_secs}s"
    return 1
}

run_upstart_cmd_with_timeout() {
    label="$1"
    cmd="$2"
    timeout_secs="$3"

    sh -c "$cmd" >/dev/null 2>/dev/null &
    cmd_pid=$!
    elapsed=0
    while kill -0 "$cmd_pid" 2>/dev/null; do
        if [ "$elapsed" -ge "$timeout_secs" ]; then
            kill "$cmd_pid" >/dev/null 2>/dev/null || true
            sleep 1
            kill -9 "$cmd_pid" >/dev/null 2>/dev/null || true
            log "$label timeout after ${timeout_secs}s"
            return 124
        fi
        sleep 1
        elapsed=$((elapsed + 1))
    done

    wait "$cmd_pid"
    rc=$?
    log "$label rc=$rc"
    return "$rc"
}

# ============================================================
# Diagnostics
# ============================================================

debug_snapshot() {
    log "debug snapshot begin"
    log_cmd "pwd" pwd
    log_cmd "initctl help" initctl --help
    log_cmd "process snapshot" sh -c "ps 2>/dev/null | grep -E 'tizen-mtp|/usr/sbin/mtp|framework|lab126|appmgrd|koreader|luajit' | grep -v grep || true"
    log_cmd "mount functionfs" sh -c "mount 2>/dev/null | grep -i functionfs || true"
    if [ -r /sys/class/power_supply/usb/online ]; then
        log_cmd "usb online" cat /sys/class/power_supply/usb/online
    else
        log "usb online rc=1 out=missing:/sys/class/power_supply/usb/online"
    fi
    log_cmd "udc list" sh -c "ls -la /sys/class/udc/ 2>/dev/null || true"
    log_cmd "gadget dir" sh -c "ls -la \"$GDIR\" 2>/dev/null || true"
    log_cmd "gadget functions" sh -c "ls -la \"$GDIR/functions\" 2>/dev/null || true"
    log_cmd "gadget configs" sh -c "ls -la \"$GDIR/configs\" 2>/dev/null || true"
    log_cmd "gadget UDC" sh -c "cat \"$GDIR/UDC\" 2>/dev/null || true"
    log "debug snapshot end"
}

# ============================================================
# Display helpers
# ============================================================

force_refresh() {
    eips -c > /dev/null 2>&1
    eips -c > /dev/null 2>&1
    sleep 1
}

show_splash() {
    [ -z "$EIPS_BIN" ] && return
    if [ -f "$SPLASH" ]; then
        "$EIPS_BIN" -g "$SPLASH" > /dev/null 2>&1
    else
        "$EIPS_BIN" 0 0 "Zen MTP" > /dev/null 2>&1
    fi
}

stop_splash_daemon() {
    touch "$SPLASH_STOP_FILE" >/dev/null 2>/dev/null || true
    if [ -r "$SPLASH_PID_FILE" ]; then
        splash_pid="$(cat "$SPLASH_PID_FILE" 2>/dev/null)"
        if [ -n "$splash_pid" ] && kill -0 "$splash_pid" 2>/dev/null; then
            kill "$splash_pid" >/dev/null 2>/dev/null || true
        fi
    fi
    rm -f "$SPLASH_PID_FILE" >/dev/null 2>/dev/null || true
}

start_splash_daemon() {
    duration_secs="$1"

    if [ -z "$EIPS_BIN" ]; then
        log "start_splash_daemon skipped: eips not found"
        return
    fi

    stop_splash_daemon
    rm -f "$SPLASH_STOP_FILE" >/dev/null 2>/dev/null || true

    (
        echo "$$" > "$SPLASH_PID_FILE" 2>/dev/null || true
        _i=0
        while [ "$_i" -lt "$duration_secs" ]; do
            if [ -f "$SPLASH_STOP_FILE" ]; then
                break
            fi
            if [ -f "$SPLASH" ]; then
                "$EIPS_BIN" -g "$SPLASH" >/dev/null 2>/dev/null
            else
                "$EIPS_BIN" 0 0 "Zen MTP" >/dev/null 2>/dev/null
            fi
            sleep 1
            _i=$((_i + 1))
        done
        rm -f "$SPLASH_PID_FILE" >/dev/null 2>/dev/null || true
    ) >/dev/null 2>/dev/null &
    log "start_splash_daemon pid=$! duration=${duration_secs}s"
}

# ============================================================
# MTP helpers
# ============================================================

mtp_process_running() {
    ps 2>/dev/null | grep -q "tizen-mtp"
}

functionfs_ready() {
    mount 2>/dev/null | grep -q " on /dev/usb-ffs/mtp type functionfs"
}

mtp_looks_healthy() {
    mtp_process_running && functionfs_ready
}

wait_for_mtp_runtime_ready() {
    timeout_secs="$1"
    elapsed=0
    while [ "$elapsed" -lt "$timeout_secs" ]; do
        if mtp_looks_healthy; then
            log "wait_for_mtp_runtime_ready reached ready at ${elapsed}s"
            return 0
        fi
        sleep 1
        elapsed=$((elapsed + 1))
    done
    log "wait_for_mtp_runtime_ready timeout after ${timeout_secs}s"
    return 1
}

wait_for_mtp_health() {
    timeout_secs="$1"
    elapsed=0
    while [ "$elapsed" -lt "$timeout_secs" ]; do
        if mtp_looks_healthy; then
            log "wait_for_mtp_health reached healthy at ${elapsed}s"
            return 0
        fi
        sleep 1
        elapsed=$((elapsed + 1))
    done
    log "wait_for_mtp_health timeout after ${timeout_secs}s"
    return 1
}

restart_mtp() {
    log "restart_mtp begin"
    log_job_status "mtp"

    run_upstart_cmd_with_timeout "stop mtp" "stop mtp" 8
    wait_for_job_state "mtp" "stopped" 8 || true

    run_upstart_cmd_with_timeout "start mtp" "start mtp" 10
    wait_for_job_state "mtp" "running" 10 || true
    wait_for_mtp_runtime_ready 4 || true

    log_job_status "mtp"
    log_cmd "mtp process check" sh -c "ps 2>/dev/null | grep -E 'tizen-mtp|/usr/sbin/mtp' | grep -v grep || true"
    log "restart_mtp end"
}

bind_udc_if_needed() {
    log "bind_udc_if_needed begin"
    if [ -n "$UDC_HW" ]; then
        log "bind_udc_if_needed fire-and-forget bind to $UDC_HW"
        ( echo "$UDC_HW" > "$GDIR/UDC" 2>/dev/null ) &
        log "bind_udc_if_needed dispatched pid=$!"
    else
        log "bind_udc_if_needed skipped: no UDC_HW"
    fi
    log "bind_udc_if_needed end"
}

force_udc_reenumeration() {
    log "force_udc_reenumeration begin"
    if [ -z "$UDC_HW" ]; then
        log "force_udc_reenumeration skipped: no UDC_HW detected"
        return 1
    fi

    echo "" > "$GDIR/UDC" 2>/dev/null
    log "force_reenum cleared UDC rc=$?"
    sleep 1
    log "force_reenum fire-and-forget bind to $UDC_HW"
    ( echo "$UDC_HW" > "$GDIR/UDC" 2>/dev/null ) &
    log "force_reenum dispatched bind pid=$!"
    log "force_udc_reenumeration end"
    return 0
}

# ============================================================
# Restore daemon -- post-MTP restore: KOReader
# ============================================================

ensure_daemon_upstart_installed() {
    daemon_script="$DAEMON_SCRIPT"
    desired_marker="# zenmtp-daemon v$DAEMON_VERSION path=$DAEMON_SCRIPT"

    if [ -f "$UPSTART_DAEMON_CONF" ] && head -1 "$UPSTART_DAEMON_CONF" 2>/dev/null | grep -qF "$desired_marker"; then
        return 0
    fi

    if ! command -v mntroot >/dev/null 2>&1; then
        log "upstart install skipped: mntroot not available"
        return 1
    fi

    log "installing upstart job at $UPSTART_DAEMON_CONF (mntroot rw)"
    mntroot rw >/dev/null 2>&1
    rw_rc=$?
    if [ "$rw_rc" -ne 0 ]; then
        log "mntroot rw failed rc=$rw_rc; cannot install upstart job"
        return 1
    fi

    cat > "$UPSTART_DAEMON_CONF" <<UPSTARTCONF
$desired_marker
description "Zen MTP restore daemon"
author "ZenKindleMTP"
# marker: $desired_marker

start on zenmtp-restore

task

script
    exec /bin/sh $daemon_script
end script
UPSTARTCONF
    write_rc=$?
    chmod 644 "$UPSTART_DAEMON_CONF" 2>/dev/null || true
    mntroot ro >/dev/null 2>&1

    if [ "$write_rc" -ne 0 ]; then
        log "upstart conf write failed rc=$write_rc"
        return 1
    fi
    log "upstart job installed successfully"
    return 0
}

start_restore_daemon() {
    daemon_script="$DAEMON_SCRIPT"
    log "start_restore_daemon begin main_pid=$$ script=$daemon_script"

    if ensure_daemon_upstart_installed; then
        if initctl emit --no-wait zenmtp-restore >/dev/null 2>&1; then
            log "restore daemon dispatched via upstart event zenmtp-restore"
            return 0
        fi
        log "initctl emit failed; falling back to double-fork"
    fi

    ( setsid sh -c "nohup sh '$daemon_script' </dev/null >/dev/null 2>&1 &" ) &
    _wpid=$!
    wait "$_wpid" 2>/dev/null || true
    log "restore daemon dispatched via double-fork (intermediate pid=$_wpid)"
}

# ============================================================
# Main
# ============================================================

force_refresh
log "ZenMTP v$DAEMON_VERSION main_script start pid=$$"

# Clean up flags from previous incomplete session
rm -f "$ZENMTP_SETUP_DONE_FLAG" 2>/dev/null || true
rm -f /tmp/zenmtp_from_koreader 2>/dev/null || true

# Save raw brightness before MTP (framework may turn it off during teardown)
for _bl in /sys/class/backlight/*/brightness; do
    [ -r "$_bl" ] && cat "$_bl" > /tmp/zenmtp_fl_br 2>/dev/null && break
done

# --- Start restore daemon ---
touch "$ZENMTP_RESTORE_FLAG" 2>/dev/null || true
echo "$$" > "$ZENMTP_MAIN_PID_FILE" 2>/dev/null || true
# Signal daemon that ZenMTP was launched from KOReader
if [ "$ZENMTP_KOREADER_HANDOFF" = 1 ]; then
    touch /tmp/zenmtp_from_koreader 2>/dev/null || true
    log "zenmtp_from_koreader flag set"
fi
trap 'rm -f "$ZENMTP_MAIN_PID_FILE" 2>/dev/null || true' EXIT
log "wrote restore flag + main_pid=$$"
start_restore_daemon

# --- Splash while MTP starts ---
show_splash
start_splash_daemon 60

# Stop usbnet jobs
for JOB in usbnetlite usbnetd usbnet-autostart usbnetwork usbnet; do
    stop "$JOB" >/dev/null 2>/dev/null || true
done
rm -f /mnt/us/usbnet/auto 2>/dev/null || true

debug_snapshot

# Ignore framework signals during MTP setup
trap '' TERM HUP

log "Clearing gadget UDC binding"
echo "" > "$GDIR/UDC" 2>/dev/null || true

# Kill splash daemon now so it doesn't fight the framework for the
# e-ink display during MTP restart. The last splash frame stays on
# screen (e-ink persistence) until the framework draws the MTP UI.
stop_splash_daemon

restart_mtp
bind_udc_if_needed

if ! mtp_looks_healthy; then
    log "MTP not healthy after first attempt; retrying"
    restart_mtp
    bind_udc_if_needed
fi

force_udc_reenumeration || true
wait_for_mtp_health 4 || true

# Signal daemon that setup is complete
touch "$ZENMTP_SETUP_DONE_FLAG" 2>/dev/null || true
log "wrote setup-done flag"

if ! mtp_looks_healthy; then
    debug_snapshot
fi

if mtp_looks_healthy; then
    log "ZenMTP success"
else
    log "ZenMTP failed health-check"
    if [ -n "$EIPS_BIN" ]; then
        "$EIPS_BIN" -c >/dev/null 2>/dev/null
        "$EIPS_BIN" -c >/dev/null 2>/dev/null
        eips 0 4 "MTP did not start." >/dev/null 2>&1
        eips 0 5 "See /tmp/zenmtp.log" >/dev/null 2>&1
    fi
fi
