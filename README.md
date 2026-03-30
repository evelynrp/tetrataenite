![tetrataenite logo](tetrataenite.png)

# tetrataenite &nbsp; [![bluebuild build badge](https://github.com/evelynrp/tetrataenite/actions/workflows/build.yml/badge.svg)](https://github.com/evelynrp/tetrataenite/actions/workflows/build.yml)

## What is this?

tetrataenite is a desktop Linux operating system. It is built using BlueBuild and shipped as a set of OCI bootable containers, using BlueBuild's base images as a starting point.

## Why does this exist?

One can only deal with finding trojans on work computers so many times. I wanted something that was relatively maintenance-free and relatively "grandma-proof" that was still reasonably secure. [Project Bluefin](https://projectbluefin.io) was considered, but ruled out because of their insistence on flatpak browsers, which I consider to be too big a security compromise. [secureblue](https://secureblue.dev) was considered, but usability was an issue. tetrataenite is sort of like a middle ground between the two.

## What's included?

- Automatic updates, `brew`, `blujust`, and other improvements included in BlueBuild's base images.
- nvidia-open, because my personal laptop is a Legion, also provided by BlueBuild's nvidia-open image.
- Bazaar (rpm) and Trivalent from secureblue.
- Google Chrome with policies and flags from [RKNF404](https://github.com/RKNF404/chromium-hardening-guide).
  - I might later remove one or the other browser. Both were included because I prefer Trivalent but it might cause usability issues for coworkers.
- [Mullvad VPN](https://mullvad.net) baked in because there is no flatpak.
- vscode baked in because the flatpak doesn't work well. Might later incorporate [uBlue's homebrew tap](https://github.com/ublue-os/homebrew-tap) instead.
- Very few applications installed out of the box; you will need to install your own text editor, image viewer, video player, etc, via flatpak/Bazaar

## Should I use this?

Probably not. It's tailored exactly to my own taste, and is not really intended for anybody else's use. Go ahead if you want to, though.