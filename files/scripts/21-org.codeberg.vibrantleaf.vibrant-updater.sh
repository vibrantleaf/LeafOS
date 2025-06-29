#!/usr/bin/env bash
set -x
set -e
set -u
set -o pipefail
mkdir -p /sources
git clone https://codeberg.org/vibrantleaf/vibrant-updater.git /sources/org.codeberg.vibrantleaf.vibrant-updater
(cd /sources/org.codeberg.vibrantleaf.vibrant-updater/;git fetch --tags)
(cd /sources/org.codeberg.vibrantleaf.vibrant-updater/;latestTag=$(git describe --tags "$(git rev-list --tags --max-count=1)"))
(cd /sources/org.codeberg.vibrantleaf.vibrant-updater/;git checkout $latestTag)
(cd /sources/org.codeberg.vibrantleaf.vibrant-updater/;go build -o /usr/bin/vibrant-updater /sources/org.codeberg.vibrantleaf.vibrant-updater/src/vibrant_updater.go)
mkdir -p /usr/share/vibrant-updater/
install -Dm 644 /sources/org.codeberg.vibrantleaf.vibrant-updater/LICENSE.txt /usr/share/vibrant-updater/LICENSE.en.txt
install -Dm 644 /sources/org.codeberg.vibrantleaf.vibrant-updater/src/VibrantUpdater.just /usr/share/vibrant-updater/VibrantUpdater.just
install -Dm 644 /sources/org.codeberg.vibrantleaf.vibrant-updater/src/VibrantUpdater-user.timer /usr/share/vibrant-updater/VibrantUpdater-user.timer
install -Dm 644 /sources/org.codeberg.vibrantleaf.vibrant-updater/assets/Logo_Circle.svg /usr/share/icons/hicolor/scalable/apps/org.codeberg.vibrantleaf.vibrant-updater.svg
chmod 644 /usr/share/applications/org.codeberg.vibrantleaf.vibrant-updater.desktop
chmod 644 /usr/libexec/exec-vibrant-updater
chmod +x /usr/libexec/exec-vibrant-updater
chmod +x /usr/bin/vibrant-updater
