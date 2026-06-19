# Security Policy

## Supported Versions

Only the latest release of this project is actively maintained. Security fixes will not be backported to older versions.

| Version | Supported |
|---------|-----------|
| Latest release | ✅ |
| Older releases | ❌ |

## Reporting a Vulnerability

If you discover a security vulnerability in this project **please do not open a public GitHub issue.** Instead, report it privately so it can be addressed before any public disclosure.

**To report a vulnerability:**

1. Go to the [Security Advisories](https://github.com/xZenLabs/ZenMTP/security/advisories) page on GitHub.
2. Click **"Report a vulnerability"** and fill in the details.

Alternatively, you can reach out directly by opening a [private issue](https://github.com/xZenLabs/ZenMTP/issues) and marking it as confidential, or by contacting the maintainer through GitHub.

Please include:

- A clear description of the vulnerability and its potential impact
- Steps to reproduce, if applicable
- Any relevant file paths, code references, or log output

## Response

Reported vulnerabilities will be reviewed and responded to as promptly as possible. Once a fix is ready, a new release will be published and the advisory will be made public.

## Scope

ZenMTP is a tool to enter/exit USB MTP mode on newer MediaTek Kindles, distributed as a KOReader plugin and a standalone scriptlet. It does not run a server, handle authentication, or process external user data. The code runs locally on the user's Kindle. The primary security surface is:

- The KOReader plugin (`zen_mtp.koplugin/main.lua`), which deploys payload files to the Kindle (hash-verified) and monkey-patches KOReader internals at require-time
- The on-device shell scripts (`ZenMTP.sh`, `zen_mtpd.sh`), which manipulate USB gadget configuration, upstart jobs, and the device frontlight while running on the user's Kindle
- The release and deploy workflows in `.github/`, which build and publish the distributed `ZenMTP.zip` artifact

Out-of-scope reports (e.g. vulnerabilities in KOReader itself, in the Kindle firmware, or in the underlying device OS) should be directed to the appropriate upstream project.
