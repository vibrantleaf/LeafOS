#!/usr/bin/env bash
set -x
set -u
set -o pipefail
mkdir -p /sources
git clone https://codeberg.org/vibrantleaf/vibrant-updater.git /sources/org.codeberg.vibrantleaf.vibrant-updater
(cd /sources/org.codeberg.vibrantleaf.vibrant-updater/;git fetch --tags)
(cd /sources/org.codeberg.vibrantleaf.vibrant-updater/;latestTag=$(git describe --tags "$(git rev-list --tags --max-count=1)"))
(cd /sources/org.codeberg.vibrantleaf.vibrant-updater/;git checkout $latestTag)
(cd /sources/org.codeberg.vibrantleaf.vibrant-updater/;go build -o /usr/bin/vibrant-updater /sources/org.codeberg.vibrantleaf.vibrant-updater/src/vibrant_updater.go)
mkdir -p /usr/share/org.codeberg.vibrantleaf.vibrant-updater/
mkdir -p /usr/share/licenses/org.codeberg.vibrantleaf.vibrant-updater/
install -Dm 644 /sources/org.codeberg.vibrantleaf.vibrant-updater/bin/exec-vibrant-updater.sh /usr/libexec/exec-vibrant-updater
install -Dm 644 /sources/org.codeberg.vibrantleaf.vibrant-updater/LICENSE.en_UK.txt /usr/share/licenses/org.codeberg.vibrantleaf.vibrant-updater/LICENSE.en_UK.txt
install -Dm 644 /sources/org.codeberg.vibrantleaf.vibrant-updater/README.en_UK.md /usr/share/org.codeberg.vibrantleaf.vibrant-updater/README.en_UK.md
install -Dm 644 /sources/org.codeberg.vibrantleaf.vibrant-updater/src/org.codeberg.vibrantleaf.vibrant-updater.desktop /usr/share/applications/org.codeberg.vibrantleaf.vibrant-updater.desktop
install -Dm 644 /sources/org.codeberg.vibrantleaf.vibrant-updater/src/org-codeberg.vibrantleaf-vibrant-updater-sys.service /etc/systemd/system/org-codeberg.vibrantleaf-vibrant-updater-sys.service
install -Dm 644 /sources/org.codeberg.vibrantleaf.vibrant-updater/src/org-codeberg.vibrantleaf-vibrant-updater-sys.timer /etc/systemd/system/org-codeberg-vibrantleaf-vibrant-updater-sys.timer
install -Dm 644 /sources/org.codeberg.vibrantleaf.vibrant-updater/src/org-codeberg.vibrantleaf-vibrant-updater-user.service /usr/share/org.codeberg.vibrantleaf.vibrant-updater/org-codeberg-vibrantleaf-vibrant-updater-user.service
install -Dm 644 /sources/org.codeberg.vibrantleaf.vibrant-updater/src/org-codeberg.vibrantleaf-vibrant-updater-user.timer /usr/share/org.codeberg.vibrantleaf.vibrant-updater/org-codeberg-vibrantleaf-vibrant-updater-user.timer
install -Dm 644 /sources/org.codeberg.vibrantleaf.vibrant-updater/src/org.codeberg.vibrantleaf.vibrant-updater.just /usr/share/org.codeberg.vibrantleaf.vibrant-updater/org.codeberg.vibrantleaf.vibrant-updater.just
install -Dm 644 /sources/org.codeberg.vibrantleaf.vibrant-updater/assets/Logo_Circle.svg /usr/share/icons/hicolor/scalable/apps/org.codeberg.vibrantleaf.vibrant-updater.svg
install -Dm 644 /sources/org.codeberg.vibrantleaf.vibrant-updater/assets/Logo_Circle.png /usr/share/icons/hicolor/256x256/apps/org.codeberg.vibrantleaf.vibrant-updater.png
chmod +x /usr/libexec/exec-vibrant-updater
chmod +x /usr/bin/vibrant-updater
