#!/usr/bin/env bash

git clone --recursive https://github.com/gnif/LookingGlass.git /opt/io.looking-glass.client

(cd /opt/io.looking-glass.client/;git fetch --tags && git checkout $(git describe --tags '$(git rev-list --tags --max-count=1)'))

mkdir -p /opt/io.looking-glass.client/client/build
(cd /opt/io.looking-glass.client/client/build;cmake -DENABLE_PIPEWIRE=no -DENABLE_LIBDECOR=ON -DCMAKE_INSTALL_PREFIX=/usr ../)
(cd /opt/io.looking-glass.client/client/build;make)

mkdir -p /usr/share/doc/looking-glass-client/
chmod 644 /usr/share/applications/looking-glass.desktop
install -Dm 644 /opt/io.looking-glass.client/client/build/looking-glass-client /usr/bin/looking-glass-client
install -Dm 644 /opt/io.looking-glass.client/README.md /usr/share/doc/looking-glass-client/README.md
install -Dm 644 /opt/io.looking-glass.client/LICENSE /usr/share/doc/looking-glass-client/LICENSE
install -Dm 644 /opt/io.looking-glass.client/AUTHORS /usr/share/doc/looking-glass-client/AUTHORS
install -Dm 644 /opt/io.looking-glass.client/CONTRIBUTORS /usr/share/doc/looking-glass-client/CONTRIBUTORS
install -Dm 644 /opt/io.looking-glass.client/resources/lg-logo.svg /usr/share/icons/hicolor/scalable/apps/io.looking-glass.client.svg

chmod +x /usr/bin/looking-glass-client
