---
title: Design decisions
weight: 6
---

## Why does this exist?

One can only deal with finding trojans on work computers so many times. tetrataenite aims to be relatively maintenance-free and "grandma-proof" while still being reasonably secure.

[Project Bluefin](https://projectbluefin.io) was considered, but ruled out because it relies on Flatpak browsers, which is too big a security compromise. [secureblue](https://secureblue.dev) was considered, but usability was an issue. tetrataenite sits somewhere in the middle.

## Updates

System services handle automatic bootc and Flatpak updates. BlueBuild's brew module handles automatic updates of Homebrew and everything installed with it. brew-proxy lets Homebrew work properly on multi-user systems.

## Web browser

Firefox is removed entirely and replaced with Google Chrome, configured with policies from [RKNF404's Chromium Hardening Guide](https://github.com/RKNF404/chromium-hardening-guide). While Mozilla deserves ideological support, Firefox has real security shortcomings, especially around process isolation.

Chrome blocks all extensions except uBlock Origin Lite, Bitwarden, and KeePassXC-Browser.

## App store

GNOME Software and KDE Discover are removed and replaced with secureblue's Bazaar package. Bazaar blocklists all web browsers because of sandboxing problems with Flatpak browsers. Fedora's default Flatpak remotes are removed and replaced with a verified-only Flathub remote.

## NVIDIA

The NVIDIA images use the `nvidia-open` kernel modules and are only meant for Turing cards and newer. They're built on BlueBuild's base images rather than upstream Fedora Atomic images.

## Keeping things small

VS Code and some extra fonts used to be included, but were removed to simplify the image and reduce reliance on outside repositories. They're now available through Homebrew instead (see [Optional extras](../extras)).

Because tetrataenite is meant to be a turnkey system for non-technical users, only GNOME and KDE Plasma images are offered.

## Testing

Changes land on a testing branch first, which the maintainer uses daily and tries to break. If nothing breaks, testing is merged into main.

## Trust surface

These are the outside sources tetrataenite relies on:

- Fedora
- secureblue's package COPR
- Google's official Chrome repository
- extensions.gnome.org
- Flathub
- Homebrew
