# Install Universal Blue's homebrew tap
ublue-brew-tap:
    #!/usr/bin/bash
    brew tap ublue-os/tap
    echo 'Universal Blue's homebrew tap is now installed.'

# Failsafe to enable system flathub in case they don't get baked in
enable-system-flathub:
    #!/usr/bin/bash
    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
    echo 'Flathub is now enabled.'

# Install MS Core Fonts
install-ms-core-fonts:
    #!/usr/bin/env bash
    set -euo pipefail
    brew install cabextract
    _sfpath="http://downloads.sourceforge.net/corefonts"
    fonts=( \
        $_sfpath/andale32.exe \
        $_sfpath/arial32.exe \
        $_sfpath/arialb32.exe \
        $_sfpath/comic32.exe \
        $_sfpath/courie32.exe \
        $_sfpath/georgi32.exe \
        $_sfpath/impact32.exe \
        $_sfpath/times32.exe \
        $_sfpath/trebuc32.exe \
        $_sfpath/verdan32.exe \
        $_sfpath/webdin32.exe \
    )
    tmpdir=$(mktemp -d)
    cd "$tmpdir"
    for url in "${fonts[@]}"; do
        wget "$url"
        cabextract "$(basename $url)" -d fonts
    done
    mkdir -p ~/.local/share/fonts/mscorefonts
    cp -v fonts/*.ttf fonts/*.TTF ~/.local/share/fonts/mscorefonts/
    cd ~
    rm -rf "$tmpdir"
    fc-cache -f ~/.local/share/fonts/mscorefonts
    echo 'Microsoft fonts are now installed.'
