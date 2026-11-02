---
title: Updates
weight: 2
---

tetrataenite keeps itself up to date. You don't need to do anything, but it helps to know what's going on.

## What updates, and when

| What | How often |
|---|---|
| The operating system | Checked about every 8 hours |
| Apps from Bazaar (Flatpaks) | Daily |
| Homebrew and command-line tools | Automatically, in the background |

## System updates are atomic

The operating system updates as a single piece. A new version is downloaded in the background and prepared alongside the one you're using. Nothing changes until you restart, at which point your computer starts up on the new version.

Because the whole system is swapped at once, an update can't leave your computer half-updated or broken. Your files, settings, and apps aren't touched.

## Rolling back

If something doesn't work right after an update, you can go back to the previous version:

- **At startup:** choose the previous entry in the boot menu. This is a one-time switch.
- **Permanently:** run the following, then restart:

  ```bash
  rpm-ostree rollback
  ```

The next automatic update will move you forward again.

## "Your system is out of date"

If your system hasn't updated in over a week, tetrataenite shows a notification. This usually means the computer has been off, offline, or hasn't been restarted in a while. To update right away, open a terminal and run:

```bash
sudo bootc upgrade
```

Then restart.

## Checking your current version

```bash
rpm-ostree status
```

The entry marked with a ● is the version you're currently running.
