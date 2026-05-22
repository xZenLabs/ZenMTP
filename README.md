# ZenKindleMTP

A standalone scriptlet that disables USBNetwork and switches newer MediaTek Kindles (Scribe, 11th gen, etc.) into MTP file-transfer mode.

## How it works

On newer Kindles, the MTP gadget is managed by `tizen-mtp` via an upstart job. When USBNetwork is active it claims the USB gadget and blocks MTP. Simply stopping USBNetwork isn't enough — `tizen-mtp` must be restarted to reinitialize its FunctionFS descriptors.

`ZenMTP.sh`:

1. Shows a splash screen via `eips`.
2. Stops USBNetlite upstart jobs and removes the auto-start flag.
3. Clears the USB gadget's UDC binding.
4. Restarts the `mtp` upstart job so `tizen-mtp` reinitializes.
5. Waits for readiness, then manually binds the UDC if needed.

After the script exits, the Kindle's native "connected to computer" screen takes over.

## Compatibility

Newer MediaTek Kindles using `libcomposite`/`configfs` (2023+ ish). Not intended for older models using `g_ether` or `g_ffs`.

## Installation

### KOReader plugin install (recommended)

1. Download the latest `ZenMTP-vX.X.zip` from [Releases](https://github.com/AnthonyGress/ZenKindleMTP/releases).
2. Unzip it.
3. Copy `zenmtp.koplugin` into your KOReader plugins directory.
4. Enable `Zen MTP` in KOReader plugin settings.

On plugin init, `zenmtp.koplugin` will install `ZenMTP` to `/mnt/us/documents/ZenMTP` if it does not exist already.

```
/mnt/us/documents/ZenMTP/
├── ZenMTP.sh
└── zen.png
```

### Assign a gesture in KOReader

1. Open KOReader Gestures settings.
2. Pick a gesture and assign action `Zen MTP: switch to MTP`.
3. Trigger that gesture to run the script.

### Standalone script install (manual)

If you do not use the plugin, copy `ZenMTP` directly to `/mnt/us/documents`:

```
/mnt/us/documents/ZenMTP/
├── ZenMTP.sh
└── zen.png
```

