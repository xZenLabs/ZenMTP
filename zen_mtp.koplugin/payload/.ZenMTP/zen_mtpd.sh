#!/bin/sh
# zen_mtpd.sh -- restores KOReader + frontlight after MTP disconnects
RESTORE_FLAG="/tmp/zenmtp_restore_needed"
KOREADER_LAUNCH="/mnt/us/koreader/koreader.sh"
LOG="/tmp/zenmtp.log"
DAEMON_DIR="$(cd "$(dirname "$0")" && pwd)"
MAIN_PID_FILE="/tmp/zenmtp_main.pid"
SETUP_DONE_FLAG="/tmp/zenmtp_setup_done"
GDIR="/sys/kernel/config/usb_gadget/mtpgadget"
LOCK="/tmp/zenmtp_daemon.lock"

log_d() { echo "$(date '+%Y-%m-%d %H:%M:%S') restore-daemon $*" >> "$LOG"; }

if [ -r "$LOCK" ]; then
    _other="$(cat "$LOCK" 2>/dev/null)"
    if [ -n "$_other" ] && kill -0 "$_other" 2>/dev/null; then
        log_d "another daemon already running pid=$_other; exiting"
        exit 0
    fi
fi
echo "$$" > "$LOCK" 2>/dev/null || true
trap 'rm -f "$LOCK" 2>/dev/null || true' EXIT
trap '' TERM HUP INT QUIT USR1 USR2

_ppid="$(cut -d' ' -f4 /proc/$$/stat 2>/dev/null)"
log_d "started pid=$$ ppid=$_ppid"

zenmtp_running() {
    if [ -r "$MAIN_PID_FILE" ]; then
        _mpid="$(cat "$MAIN_PID_FILE" 2>/dev/null)"
        if [ -n "$_mpid" ] && kill -0 "$_mpid" 2>/dev/null; then
            return 0
        fi
    fi
    return 1
}

mtp_is_active() {
    _mtp_found=0
    for _p in /proc/[0-9]*; do
        [ -r "$_p/comm" ] || continue
        case "$(cat "$_p/comm" 2>/dev/null)" in
            tizen-mtp) _mtp_found=1; break ;;
        esac
    done
    [ "$_mtp_found" -eq 0 ] && return 1
    mount 2>/dev/null | grep -q " on /dev/usb-ffs/mtp type functionfs" || return 1
    if [ -f "$SETUP_DONE_FLAG" ]; then
        [ -n "$GDIR" ] && [ -r "$GDIR/UDC" ] && [ -n "$(cat "$GDIR/UDC" 2>/dev/null)" ] || return 1
    fi
    return 0
}

log_mtp_state() {
    _lm=0
    for _lp in /proc/[0-9]*; do
        [ -r "$_lp/comm" ] || continue
        case "$(cat "$_lp/comm" 2>/dev/null)" in
            tizen-mtp) _lm=1; break ;;
        esac
    done
    _lu="$(ls /sys/class/udc/ 2>/dev/null | head -1)"
    _ls="none"
    [ -n "$_lu" ] && _ls="$(cat "/sys/class/udc/$_lu/state" 2>/dev/null || echo read_err)"
    _flag=N; [ -f "$RESTORE_FLAG" ] && _flag=Y
    log_d "mtp_state tizen_mtp=${_lm} udc=${_lu:-none} udc_state=${_ls} flag=${_flag}"
}

koreader_running() {
    ps 2>/dev/null | grep -E 'koreader|reader\.lua|luajit' | grep -v grep | grep -q .
}

# --- Phase 1: wait for MTP to come online (up to 120s) ---
_t=0
seen_active=0
while [ "$_t" -lt 120 ]; do
    if [ ! -f "$RESTORE_FLAG" ]; then
        log_d "restore flag cleared during startup wait at ${_t}s; exiting"
        exit 0
    fi
    if [ "$_t" -eq 0 ] || [ $((_t % 20)) -eq 0 ]; then log_mtp_state; fi
    if mtp_is_active; then
        seen_active=1
        log_d "MTP active detected at ${_t}s; entering session watch"
        break
    fi
    sleep 2
    _t=$((_t + 2))
done

if [ "$seen_active" -eq 0 ]; then
    log_mtp_state
    log_d "MTP never reached active within 120s; exiting"
    exit 0
fi

log_mtp_state
log_d "phase2 begin"

# --- Phase 2: poll until MTP goes inactive (up to 6h), then restore ---
_t=0
_hb=0
inactive_streak=0
while [ "$_t" -lt 21600 ]; do
    if [ ! -f "$RESTORE_FLAG" ]; then
        log_d "restore flag cleared mid-session at ${_t}s; exiting"
        exit 0
    fi
    _mtp_now=0
    if mtp_is_active; then
        _mtp_now=1
        inactive_streak=0
    else
        inactive_streak=$((inactive_streak + 2))
        if [ "$inactive_streak" -ge 4 ]; then
            log_mtp_state
            log_d "MTP inactive for ${inactive_streak}s at elapsed=${_t}s; triggering restore"
            break
        fi
    fi
    sleep 2
    _t=$((_t + 2))
    _hb=$((_hb + 2))
    if [ "$_hb" -ge 30 ]; then
        log_mtp_state
        log_d "heartbeat alive at ${_t}s inactive_streak=${inactive_streak}"
        # If KOReader is running (e.g. launched manually during MTP), abort.
        if koreader_running; then
            log_d "koreader detected running at heartbeat; clearing flag and exiting"
            rm -f "$RESTORE_FLAG" 2>/dev/null || true
            exit 0
        fi
        _hb=0
    fi
done

if [ "$_t" -ge 21600 ]; then log_d "timeout 6h; exiting"; exit 0; fi

# Only restore KOReader if ZenMTP was launched from within KOReader
if [ ! -f /tmp/zenmtp_from_koreader ]; then
    log_d "not launched from KOReader; skipping KOReader restore"
    rm -f "$RESTORE_FLAG" 2>/dev/null || true
    exit 0
fi

# Kill orphaned splash daemon before anything else
touch "/tmp/zenmtp_splash.stop" 2>/dev/null || true
if [ -r "/tmp/zenmtp_splash.pid" ]; then
    _spid="$(cat "/tmp/zenmtp_splash.pid" 2>/dev/null)"
    if [ -n "$_spid" ] && kill -0 "$_spid" 2>/dev/null; then
        kill "$_spid" 2>/dev/null || true
        log_d "killed orphaned splash daemon pid=$_spid"
    fi
fi
rm -f "/tmp/zenmtp_splash.pid" 2>/dev/null || true

ZEN_SPLASH="/mnt/us/documents/ZenMTP/zen.png"

# Draw splash once so it covers the gap between MTP disconnect and
# KOReader startup. E-ink retains it until KOReader draws its UI.
# Don't clear eips — that would flash a blank screen or let the
# framework homescreen show through.
if [ -f "$ZEN_SPLASH" ] && command -v eips >/dev/null 2>&1; then
    eips -g "$ZEN_SPLASH" 2>/dev/null || true
fi

# If KOReader is already running, don't interfere — clear flag and exit.
if koreader_running; then
    log_d "koreader already running; clearing flag and exiting"
    rm -f "$RESTORE_FLAG" 2>/dev/null || true
    exit 0
fi

rm -f "$RESTORE_FLAG" 2>/dev/null || true
rm -f /tmp/zenmtp_from_koreader 2>/dev/null || true

if [ -f "$KOREADER_LAUNCH" ]; then
    nohup sh "$KOREADER_LAUNCH" --kual --framework_stop </dev/null >/dev/null 2>&1 &
    _kpid=$!
    log_d "KOReader launched pid=$_kpid"

    _kr_wait=0
    _kr_ok=0
    while [ "$_kr_wait" -lt 60 ]; do
        if koreader_running; then
            _kr_ok=1
            break
        fi
        if [ -n "$_kpid" ] && ! kill -0 "$_kpid" 2>/dev/null; then
            log_d "KOReader launch process $_kpid died at ${_kr_wait}s"
            break
        fi
        sleep 2
        _kr_wait=$((_kr_wait + 2))
    done

    if [ "$_kr_ok" -eq 0 ]; then
        log_d "KOReader failed to start within ${_kr_wait}s; restoring Kindle UI"
        eips -c 2>/dev/null || true
        eips -c 2>/dev/null || true
        start lab126_gui >/dev/null 2>/dev/null || true
        exit 1
    fi

    log_d "KOReader running at ${_kr_wait}s"

    # Write saved brightness once to sysfs. Keep the marker file so Lua can
    # consume it and resync KOReader frontlight/warmth widget state.
    _fl_br="$(cat /tmp/zenmtp_fl_br 2>/dev/null)"
    if [ -n "$_fl_br" ] && [ "$_fl_br" -gt 0 ] 2>/dev/null; then
        for _bl in /sys/class/backlight/*/brightness; do
            [ -w "$_bl" ] && echo "$_fl_br" > "$_bl" 2>/dev/null
        done
        log_d "fl set brightness=$_fl_br"
    fi
else
    log_d "KOReader launch script not found: $KOREADER_LAUNCH"
fi
