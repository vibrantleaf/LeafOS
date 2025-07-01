#!/usr/bin/env bash
set -x
set -e
set -u
set -o pipefail
mkdir -p /sources
git clone https://codeberg.org/vibrantleaf/waydroid-wizard.git /sources/org.codeberg.vibrantleaf.waydroid-wizard
mkdir -p /usr/share/org.codeberg.vibrantleaf.waydroid-wizard
mkdir -p /usr/share/licenses/org.codeberg.vibrantleaf.waydroid-wizard
install -Dm 644 /sources/org.codeberg.vibrantleaf.waydroid-wizard/src/waydroid-wizard.sh /usr/bin/waydroid-wizard
install -Dm 644 /sources/org.codeberg.vibrantleaf.waydroid-wizard/LICENSE.en_UK.txt /usr/share/licenses/org.codeberg.vibrantleaf.waydroid-wizard/LICENSE.en_UK.txt
install -Dm 644 /sources/org.codeberg.vibrantleaf.waydroid-wizard/third_party.Licenses.en_UK.txt /usr/share/licenses/org.codeberg.vibrantleaf.waydroid-wizard/third_party.Licenses.en_UK.txt
install -Dm 644 /sources/org.codeberg.vibrantleaf.waydroid-wizard/README.en_UK.md /usr/share/org.codeberg.vibrantleaf.waydroid-wizard/README.en_UK.md
install -Dm 644 /sources/org.codeberg.vibrantleaf.waydroid-wizard/src/org.codeberg.vibrantleaf.waydroid-wizard.desktop /usr/share/applications/org.codeberg.vibrantleaf.waydroid-wizard.desktop
install -Dm 644 /sources/org.codeberg.vibrantleaf.waydroid-wizard/assets/org.codeberg.vibrantleaf.waydroid-wizard.svg /usr/share/icons/hicolor/scalable/apps/org.codeberg.vibrantleaf.waydroid-wizard.svg
install -Dm 644 /sources/org.codeberg.vibrantleaf.waydroid-wizard/assets/org.codeberg.vibrantleaf.waydroid-wizard.png /usr/share/icons/hicolor/256x256/apps/org.codeberg.vibrantleaf.waydroid-wizard.png
chmod +x /usr/bin/waydroid-wizard
