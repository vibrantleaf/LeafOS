#!/usr/bin/env bash

git clone https://codeberg.org/vibrantleaf/vibrant-updater.git /opt/org.codeberg.vibrantleaf.vibrant-updater

(cd /opt/org.codeberg.vibrantleaf.vibrant-updater;git fetch --tags && git checkout $(git describe --tags '$(git rev-list --tags --max-count=1)'))
go build -o /usr/bin/vibrant-updater /opt/org.codeberg.vibrantleaf.vibrant-updater/src/vibrant_updater.go

mkdir -p /usr/share/vibrant-updater/
install -Dm 644 /opt/org.codeberg.vibrantleaf.vibrant-updater/LICENSE.txt /usr/share/vibrant-updater/LICENSE.en.txt
install -Dm 644 /opt/org.codeberg.vibrantleaf.vibrant-updater/src/VibrantUpdater.just /usr/share/vibrant-updater/VibrantUpdater.just
install -Dm 644 /opt/org.codeberg.vibrantleaf.vibrant-updater/src/VibrantUpdater-user.timer /usr/share/vibrant-updater/VibrantUpdater-user.timer
install -Dm 644 /opt/org.codeberg.vibrantleaf.vibrant-updater/assets/Logo_Circle.svg /usr/share/icons/hicolor/scalable/apps/org.codeberg.vibrantleaf.vibrant-updater.svg


chmod 644 /usr/share/applications/vibrant-updater.desktop
chmod +x /usr/bin/vibrant-updater
