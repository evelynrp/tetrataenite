# Install Universal Blue's homebrew tap
ublue-brew-tap:
    #!/usr/bin/bash
    brew tap ublue-os/tap
    brew trust ublue-os/tap

enable-unverified-flathub:
    #!/usr/bin/bash
    flatpak remote-add --if-not-exists --user --title='Flathub (Unverified)' flathub-unverified https://dl.flathub.org/repo/flathub.flatpakrepo

# Install MS Core fonts. Might have to run this twice.
install-ms-core-fonts:
    #!/usr/bin/env bash
    set -euo pipefail
    brew install cabextract
    _sfpath="https://downloads.sourceforge.net/corefonts"
    # SHA256 sums match Debian's ttf-mscorefonts-installer cabfiles.sha256sums
    declare -A fonts=( \
        [andale32.exe]=0524fe42951adc3a7eb870e32f0920313c71f170c859b5f770d82b4ee111e970 \
        [arial32.exe]=85297a4d146e9c87ac6f74822734bdee5f4b2a722d7eaa584b7f2cbf76f478f6 \
        [arialb32.exe]=a425f0ffb6a1a5ede5b979ed6177f4f4f4fdef6ae7c302a7b7720ef332fec0a8 \
        [comic32.exe]=9c6df3feefde26d4e41d4a4fe5db2a89f9123a772594d7f59afd062625cd204e \
        [courie32.exe]=bb511d861655dde879ae552eb86b134d6fae67cb58502e6ff73ec5d9151f3384 \
        [georgi32.exe]=2c2c7dcda6606ea5cf08918fb7cd3f3359e9e84338dc690013f20cd42e930301 \
        [impact32.exe]=6061ef3b7401d9642f5dfdb5f2b376aa14663f6275e60a51207ad4facf2fccfb \
        [times32.exe]=db56595ec6ef5d3de5c24994f001f03b2a13e37cee27bc25c58f6f43e8f807ab \
        [trebuc32.exe]=5a690d9bb8510be1b8b4fe49f1f2319651fe51bbe54775ddddd8ef0bd07fdac9 \
        [verdan32.exe]=c1cb61255e363166794e47664e2f21af8e3a26cb6346eb8d2ae2fa85dd5aad96 \
        [webdin32.exe]=64595b5abc1080fba8610c5c34fab5863408e806aafe84653ca8575bed17d75a \
    )
    tmpdir=$(mktemp -d)
    trap 'rm -rf "$tmpdir"' EXIT
    cd "$tmpdir"
    for exe in "${!fonts[@]}"; do
        wget "$_sfpath/$exe"
        echo "${fonts[$exe]}  $exe" | sha256sum -c -
        cabextract "$exe" -d fonts
    done
    mkdir -p ~/.local/share/fonts/mscorefonts
    find fonts -iname '*.ttf' -exec cp -v {} ~/.local/share/fonts/mscorefonts/ \;
    cd ~
    rm -rf "$tmpdir"
    fc-cache -f ~/.local/share/fonts/mscorefonts
