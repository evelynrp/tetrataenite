---
title: Optional extras
weight: 5
---

tetrataenite includes a few opt-in tweaks you can run from a terminal. Each one is a single command.

## Microsoft fonts

Installs Microsoft's classic core fonts (Arial, Times New Roman, Verdana, Comic Sans, and others), which helps documents and websites made on Windows look right.

```bash
blujust install-ms-core-fonts
```

The fonts are installed for your user only.

## Unverified Flathub apps

By default, Bazaar only offers apps from verified publishers. To also allow unverified Flathub apps:

```bash
blujust toggle-unverified-flathub
```

Run the same command again to turn them back off.

{{< callout type="warning" >}}
Unverified apps are often repackaged by someone other than the original developer. Check who maintains an app before installing it.
{{< /callout >}}

## Universal Blue Homebrew tap

Adds [Universal Blue's Homebrew tap](https://github.com/ublue-os/homebrew-tap), which includes desktop apps that aren't on Flathub, such as VS Code, as well as extra fonts.

```bash
blujust ublue-brew-tap
```

## Unlock your disk automatically with TPM

If your disk is encrypted, you normally type a password every time you start your computer. This lets the computer's TPM chip unlock the disk automatically instead, as long as Secure Boot settings haven't been tampered with.

```bash
sudo blujust enable-luks-unlock
```

To go back to typing your password:

```bash
sudo blujust disable-luks-unlock
```

{{< callout type="error" >}}
**Don't use this on AMD Zen 1, Zen 2, or Zen 3 processors.** These are vulnerable to [faulTPM](https://arxiv.org/abs/2304.14717), which can let an attacker with physical access extract the key. If you have an AMD CPU, you probably shouldn't use this.
{{< /callout >}}

Automatic unlock is tied to your Secure Boot state. If that changes (for example, after a firmware update), you'll be asked for your password again and may need to re-run the enable command.
