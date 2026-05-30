#!/bin/sh
# Name: Zen MTP
# Author: Anthony Gress
# Icon: data:image/png;base64,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UG/hed4bhkUDGRa//C1Dl+4Yjz6LU4BbpIUjFev1JNx6/moBABcC2QfkJc396DMDCLhRXjgysVyPWS2Ydu1597wY4PsKGxPnzZs3b78lMZlgvPU5sRQYKfFNj0ys1lN0436Aq588/67DAN6vsPH1sWPHjj1hSVRiRgKL0mYXUlsrBtbreXQZQNuPanDevr2An74oty1nDlCv7/kPrgmTgNw5s7D6ocdGLNYz9xWAegtq1J1oKsCd5Uqy509hvou2gJENgWe3ARPldW+Ti7V6thqtBTNr9sp9YmcgeUCZDjjvvQQ4/25RbALHA8dBbg8dqVj73DMpG6DlunVV/H75kLJrwbMuzIcTF026q6cDYNOLXwD8tY1V0Zk83fjbvbulqbQRa/UYjWUHX67q97Byeujxxl1A8YcfNu/YKPDUb4cB6PUCVtGtxxag9lYMbOjEWy13Ou8tADh6tGRTv28sbBybtAUgaLxfE+kLfv62dOpPF5VbD3hgVbSFpx8fBGaf+NqJvz/97f3DnIElLwsi7tr6Sh1fzlaRmJFQm8s2HPIavWrMqR93J+U5o5r36W75l7O1HRX0aKrE34Wbplq0HqXRepRG61EarUdptB6l0XqURutRGq1HabQepdF6lEbrURqtR2m0HqXRepRG61EarUdptB6l0XqURutRGq1HabQepdF6lEbrURqtR2m0HqXRepRG61EarUdptB6l0XqURutRGq1HabQepdF6lEbrURqtR2m0HqXRepRG61EarUdptB6l0XqURutRGq1HabQepdF6lEbrURqtR2m0HqXRepRG61EarUdptB6l0XqURutRGq1HabQepdF6lEbrURqtR2m0HqXRepRG61EarUdptB6l0XqURutRGq1HabQepdF6lEbrURqtR2m0HqXRepRG61EarUdptB6l0XqURutRGq1HabQepdF6lEbrURqtR2m0HqXRepRG61EarUdptB6l0XqURutRGq1HabQepdF6lEbrURqtR2m0HqXRepRG61EarUdptB6l0XqURutRGq1HabQepdF6lEbrURqtR2m0HqXRepRG61EarUdptB6l0XqURutRGq1HabQepdF6lEbrURqtR2m0HqXRepRG61EarUdptB6l0XqURutRGq1HabQepdF6lEbrURqtR2m0HqXRepRG61EarUdptB6l0XqURutRGq1HabQepdF6lEbrUZr/B9aToL+YySISAAAAAElFTkSuQmCC
# Created: 2026-05-14
# Version: 1.5
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
