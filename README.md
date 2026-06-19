# ZenMTP

ZenMTP is a tool to enter/exit `USB MTP` mode on newer Kindles. I have a Kindle scriptlet that you can run as a standalone tool. If you use KOReader, there is also an included KOReader plugin that installs the Kindle scriptlet for you and switches newer MediaTek Kindles (Scribe, 11th gen, etc.) into MTP file-transfer mode, then restores KOReader when the MTP session is disconnected.

This allows you to trigger `USB MTP` mode on newer kindles without having to plug/unplug the device each time. Simply tap the ZenMTP button to trigger usb file transfer when a usb cable is already connected.

## Architecture

Three components work together:

### 1. KOReader plugin (`zen_mtp.koplugin/main.lua`)
- Registers a "Zen MTP" action in KOReader (gestures, menus)
- On init: deploys payload files to the Kindle if missing or outdated (hash-verified)
- On run: launches `ZenMTP.sh` in the background, then quits KOReader so the native Kindle MTP UI takes over
- Monkey-patches `AutoSuspend._schedule_kindle` at require-time to guard against negative t1 delay crashes after KOReader relaunch

### 2. Main script (`ZenMTP.sh`)
- Deployed to `/mnt/us/documents/ZenMTP/ZenMTP.sh` (alongside `zen.png` splash)
- Saves frontlight brightness, writes restore flag, launches the watcher, shows splash
- Stops usbnet jobs, restarts the `mtp` upstart job, binds the USB gadget UDC
- After healthy MTP is confirmed, writes a setup-done flag so the watcher knows MTP is fully ready

### 3. Restore Daemon (`zen_mtpd.sh`)
- Deployed to `/mnt/us/.ZenMTP/zen_mtpd.sh` (separate dir, outside documents/)
- Launched by `ZenMTP.sh` via upstart event `zenmtp-restore` (with double-fork fallback)
- Two-phase poll:
  - **Phase 1** (up to 120s): waits for MTP to come online (tizen-mtp process + functionfs mount + UDC bound)
  - **Phase 2** (up to 6h): heartbeat-polls MTP health every 2s; when MTP goes inactive for 4s, triggers restore
- On restore: kills splash daemon, draws splash via `eips`, launches KOReader, restores frontlight brightness
- Aborts if KOReader is already running (manual launch during MTP session)
- Uses lockfile `/tmp/zenmtp_watcher.lock` to prevent duplicate instances

## Compatibility

Newer MediaTek Kindles using `libcomposite`/`configfs` USB gadget framework (2023+). Specifically using the Kindle's `mtp` upstart job and `tizen-mtp` binary. Not intended for older models using `g_ether` or `g_ffs`.

## Installation

### KOReader plugin (recommended)

1. Copy `zen_mtp.koplugin` into KOReader's `plugins/` directory
2. Restart KOReader or enable the plugin in plugin settings
3. On first init, the payload is automatically installed to the Kindle

### Standalone scriptlet (without KOReader)

1. Download `ZenMTP.zip` from the latest release
2. Unzip it
3. Drag the extracted `.ZenMTP` folder and `documents` folder into the Kindle USB storage root (`/mnt/base-us` on the Kindle)

This installs the daemon at `/mnt/base-us/.ZenMTP/` and the scriptlet at `/mnt/base-us/documents/ZenMTP/`.

### Assign a gesture

1. Open KOReader > Gestures manager
2. Pick a gesture > Actions > "Zen MTP"
3. Trigger the gesture to switch to MTP mode
