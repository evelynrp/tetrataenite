---
title: Installation
weight: 1
---

tetrataenite doesn't have its own installer yet. Instead, you install Fedora's atomic desktop and then switch ("rebase") it to tetrataenite. Your files and settings carry over.

## 1. Choose an image

| Image | Desktop | Graphics |
|---|---|---|
| `tetrataenite-gnome` | GNOME | Intel, AMD, or older NVIDIA |
| `tetrataenite-gnome-nvidia-open` | GNOME | NVIDIA RTX 20 series (Turing) or newer |
| `tetrataenite-plasma` | KDE Plasma | Intel, AMD, or older NVIDIA |
| `tetrataenite-plasma-nvidia-open` | KDE Plasma | NVIDIA RTX 20 series (Turing) or newer |

Not sure which desktop to pick? **GNOME** is clean and simple, and a safe default if you're coming from Windows. **KDE Plasma** looks more like Windows out of the box and is easier to customize.

{{< callout type="info" >}}
The NVIDIA images use NVIDIA's open kernel modules, which only support Turing (RTX 20 series / GTX 16 series) and newer cards. If you have an older NVIDIA card, use a non-NVIDIA image.
{{< /callout >}}

## 2. Install Fedora Atomic

Download and install the Fedora atomic desktop that matches your choice:

- For GNOME images: [Fedora Silverblue](https://fedoraproject.org/atomic-desktops/silverblue/)
- For KDE Plasma images: [Fedora Kinoite](https://fedoraproject.org/atomic-desktops/kinoite/)

Follow Fedora's installer as normal. We recommend turning on disk encryption when asked.

If you're already running a Fedora Atomic desktop, skip ahead.

## 3. Rebase to tetrataenite

Open a terminal and run the following, replacing `tetrataenite-gnome` with the image you chose.

First, rebase to the unsigned image. This installs the keys needed to verify tetrataenite's signed images:

```bash
rpm-ostree rebase ostree-unverified-registry:ghcr.io/evelynrp/tetrataenite-gnome
systemctl reboot
```

After rebooting, rebase again to the signed image:

```bash
rpm-ostree rebase ostree-image-signed:docker://ghcr.io/evelynrp/tetrataenite-gnome
systemctl reboot
```

That's it. From here on, updates are automatic.

## NVIDIA and Secure Boot

The NVIDIA images are built on [BlueBuild](https://blue-build.org)'s base images, which sign the NVIDIA driver with BlueBuild's key. If Secure Boot is turned on, you need to enroll BlueBuild's Machine Owner Key (MOK) so your computer trusts the driver. Otherwise the driver won't load and you'll be stuck with basic graphics.

<!-- TODO: link BlueBuild's MOK enrollment instructions -->
