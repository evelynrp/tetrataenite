---
title: Web browser
weight: 4
---

tetrataenite ships **Google Chrome** as its web browser, with Firefox removed. Chrome is pre-configured with hardened policies and flags based on [RKNF404's Chromium Hardening Guide](https://github.com/RKNF404/chromium-hardening-guide).

## What's different from regular Chrome

Some of the changes you might notice:

- **HTTPS-only mode** is on. Chrome warns you before loading a site over an insecure connection.
- **Third-party cookies are blocked.**
- **Google sign-in and sync are turned off.**
- **The built-in password manager and autofill for cards and addresses are off.** Use a dedicated password manager instead (see below).
- **AI features, shopping features, and promotions are turned off.**
- **Telemetry and crash reporting are turned off.**

## Extensions

Only three extensions can be installed:

- [uBlock Origin Lite](https://chromewebstore.google.com/detail/ddkjiahejlhfcafbddmgiahcphecmpfh): ad and tracker blocking
- [Bitwarden](https://chromewebstore.google.com/detail/nngceckbapebfimnlniiiahkandclblb): password manager
- [KeePassXC-Browser](https://chromewebstore.google.com/detail/oboonakemofpalcgghocfoadofidjkkk): connects to the KeePassXC password manager

All other extensions are blocked. Malicious and hijacked extensions are one of the most common ways browsers get compromised, so the list is deliberately small.

## Why Chrome and not Firefox?

Chrome's sandboxing and site isolation are significantly stronger than Firefox's. See [Design decisions](../design#web-browser) for more.
