#!/bin/sh
# Name: ZenMTP
# Author: ZenLabs
# Icon: data:image/png;base64,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
# Created: 2026-05-14
# Version: 1.7
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
        "$EIPS_BIN" 0 0 "ZenMTP" > /dev/null 2>&1
    fi
}

stop_splash_daemon() {
    touch "$SPLASH_STOP_FILE" >/dev/null 2>/dev/null || true
    if [ -r "$SPLASH_PID_FILE" ]; then
        splash_pid="$(cat "$SPLASH_PID_FILE" 2>/dev/null)"
        if [ -n "$splash_pid" ] && kill -0 "$splash_pid" 2>/dev/null; then
            splash_parent="$(cut -d' ' -f4 "/proc/$splash_pid/stat" 2>/dev/null)"
            if [ "$splash_parent" = "$$" ]; then
                kill "$splash_pid" >/dev/null 2>/dev/null || true
            else
                log "stop_splash_daemon skipped pid=$splash_pid ppid=${splash_parent:-unknown}"
            fi
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
        _i=0
        while [ "$_i" -lt "$duration_secs" ]; do
            if [ -f "$SPLASH_STOP_FILE" ]; then
                break
            fi
            if mtp_looks_healthy; then
                log "splash daemon stopping: MTP is healthy"
                break
            fi
            if [ -f "$SPLASH" ]; then
                "$EIPS_BIN" -g "$SPLASH" >/dev/null 2>/dev/null
            else
                "$EIPS_BIN" 0 0 "ZenMTP" >/dev/null 2>/dev/null
            fi
            sleep 1
            _i=$((_i + 1))
        done
        rm -f "$SPLASH_PID_FILE" >/dev/null 2>/dev/null || true
    ) >/dev/null 2>/dev/null &
    splash_pid=$!
    echo "$splash_pid" > "$SPLASH_PID_FILE" 2>/dev/null || true
    log "start_splash_daemon pid=$splash_pid duration=${duration_secs}s"
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

udc_is_bound() {
    [ -r "$GDIR/UDC" ] && [ -n "$(cat "$GDIR/UDC" 2>/dev/null)" ]
}

mtp_looks_healthy() {
    mtp_process_running && functionfs_ready
}

wait_for_udc_bound() {
    timeout_secs="$1"
    elapsed=0
    while [ "$elapsed" -lt "$timeout_secs" ]; do
        if udc_is_bound; then
            log "wait_for_udc_bound reached bound at ${elapsed}s"
            return 0
        fi
        sleep 1
        elapsed=$((elapsed + 1))
    done
    log "wait_for_udc_bound timeout after ${timeout_secs}s"
    return 1
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
    stop_splash_daemon
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
description "ZenMTP restore daemon"
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

    ( nohup setsid sh "$daemon_script" </dev/null >/dev/null 2>&1 & ) &
    _wpid=$!
    wait "$_wpid" 2>/dev/null || true
    log "restore daemon dispatched via double-fork (intermediate pid=$_wpid)"
}

# ============================================================
# Main
# ============================================================

stop_splash_daemon
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
# The splash daemon stops before each draw if MTP is already healthy, and the
# MTP restart path stops it as soon as the mtp job reaches running.
show_splash
start_splash_daemon 30

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

restart_mtp
stop_splash_daemon
bind_udc_if_needed

if ! mtp_looks_healthy; then
    log "MTP not healthy after first attempt; retrying"
    show_splash
    start_splash_daemon 15
    restart_mtp
    stop_splash_daemon
    bind_udc_if_needed
fi

stop_splash_daemon
if ! wait_for_udc_bound 4; then
    log "UDC not bound after normal bind; forcing one reenumeration"
    force_udc_reenumeration || true
    wait_for_udc_bound 4 || true
fi
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
