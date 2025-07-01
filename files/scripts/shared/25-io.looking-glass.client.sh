#!/usr/bin/env bash
set -x
set -u
set -o pipefail
mkdir -p /sources
git clone --recursive https://github.com/gnif/LookingGlass.git /sources/io.looking-glass.client
(cd /sources/io.looking-glass.client/;git fetch --tags)
(cd /sources/io.looking-glass.client/;latestTag=$(git describe --tags "$(git rev-list --tags --max-count=1)"))
(cd /sources/io.looking-glass.client/;git checkout $latestTag )
mkdir -p /sources/io.looking-glass.client/client/build
(cd /sources/io.looking-glass.client/client/build;cmake -DENABLE_PIPEWIRE=no -DENABLE_LIBDECOR=ON -DCMAKE_INSTALL_PREFIX=/usr ../)
(cd /sources/io.looking-glass.client/client/build;make)
mkdir -p /usr/share/io.looking-glass.client/
mkdir -p /usr/share/licenses/io.looking-glass.client
install -Dm 644 /sources/io.looking-glass.client/client/build/looking-glass-client /usr/bin/looking-glass-client
install -Dm 644 /sources/io.looking-glass.client/README.md /usr/share/looking-glass-client/README.md
install -Dm 644 /sources/io.looking-glass.client/LICENSE /usr/share/licenses/io.looking-glass.client/LICENSE.txt
install -Dm 644 /sources/io.looking-glass.client/AUTHORS /usr/share/licenses/looking-glass-client/AUTHORS
install -Dm 644 /sources/io.looking-glass.client/CONTRIBUTORS /usr/share/licenses/looking-glass-client/CONTRIBUTORS
install -Dm 644 /sources/io.looking-glass.client/resources/lg-logo.svg /usr/share/icons/hicolor/scalable/apps/io.looking-glass.client.svg
chmod 644 /usr/share/applications/io.looking-glass.client.desktop
chmod +x /usr/bin/looking-glass-client
