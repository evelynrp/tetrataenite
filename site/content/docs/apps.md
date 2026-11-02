---
title: Installing apps
weight: 3
---

## Bazaar

**Bazaar** is tetrataenite's app store. Open it from your app menu, search for what you need, and click install. Apps from Bazaar update automatically.

Bazaar installs apps as Flatpaks, which run in a sandbox with limited access to the rest of your system. On first login, tetrataenite sets up Flathub and installs **Flatseal**, which lets you review and change each app's permissions.

### Verified apps only

By default, Bazaar only shows apps from **Flathub's verified publishers**: apps published by the people who actually make them. This rules out repackaged or impersonated apps.

If you need an app that isn't verified, you can turn on unverified Flathub apps. See [Optional extras](../extras#unverified-flathub-apps).

### Why there are no browsers in Bazaar

Web browsers are hidden from Bazaar on purpose. Flatpak's sandbox interferes with the browser's own, stronger sandbox, so Flatpak browsers end up less secure. tetrataenite includes a [hardened Google Chrome](../browser) instead.

## Homebrew

[Homebrew](https://brew.sh) is included for command-line tools and developer software. It's already installed and keeps itself updated:

```bash
brew install <package>
```

tetrataenite uses **brew-proxy** so Homebrew works properly when several people share a computer.

Some apps that aren't on Flathub, such as JetBrains Toolbox, or don't work quite as well on Flatpak, such as VS Code, are available through Universal Blue's Homebrew tap. See [Optional extras](../extras#universal-blue-homebrew-tap).

## Distrobox

For anything that needs a traditional Linux setup, **Distrobox** is included. It lets you create containers running other Linux distributions (Ubuntu, Arch, and so on) that integrate with your desktop.

```bash
distrobox create --name ubuntu --image ubuntu:latest
distrobox enter ubuntu
```
