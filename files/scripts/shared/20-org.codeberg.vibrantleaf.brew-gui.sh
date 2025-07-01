#!/usr/bin/env bash
set -x
set -e
set -u
set -o pipefail
mkdir -p /sources
git clone https://codeberg.org/vibrantleaf/brew-gui.git /sources/org.codeberg.vibrantleaf.brew-gui
mkdir -p /usr/share/org.codeberg.vibrantleaf.brew-gui/
mkdir -p /usr/share/licenses/org.codeberg.vibrantleaf.brew-gui/
install -Dm 644 /sources/org.codeberg.vibrantleaf.brew-gui/src/brew-gui.sh /usr/bin/brew-gui
install -Dm 644 /sources/org.codeberg.vibrantleaf.brew-gui/README.en_UK.md /usr/share/org.codeberg.vibrantleaf.brew-gui/README.en_UK.md
install -Dm 644 /sources/org.codeberg.vibrantleaf.brew-gui/LICENSE.en_UK.txt /usr/share/licenses/org.codeberg.vibrantleaf.brew-gui/LICENSE.en_UK.txt
install -Dm 644 /sources/org.codeberg.vibrantleaf.brew-gui/src/org.codeberg.vibrantleaf.brew-gui.desktop /usr/share/applications/org.codeberg.vibrantleaf.brew-gui.desktop
install -Dm 644 /sources/org.codeberg.vibrantleaf.brew-gui/assets/org.codeberg.vibrantleaf.brew-gui.svg /usr/share/icons/hicolor/scalable/apps/org.codeberg.vibrantleaf.brew-gui.svg
install -Dm 644 /sources/org.codeberg.vibrantleaf.brew-gui/assets/org.codeberg.vibrantleaf.brew-gui.png /usr/share/icons/hicolor/256x256/apps/org.codeberg.vibrantleaf.brew-gui.png
chmod +x /usr/bin/brew-gui
