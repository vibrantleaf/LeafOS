#!/usr/bin/env bash

git clone https://github.com/vibrantleaf/sharkfin.git /opt/com.github.vibrantleaf.sharkfin
mkdir -p /usr/share/sharkfin
cp -fv /opt/com.github.vibrantleaf.sharkfin/cosign.pub /usr/share/sharkfin/cosign.pub
git clone https://gist.github.com/AggamR/314eaa3ef6d5488ed7ebd9eb39404390.git /opt/com.github.gist.AggamR.get_ms_fonts_from_a_windows_10_iso
install -Dm 644 /opt/com.github.gist.AggamR.get_ms_fonts_from_a_windows_10_iso/getMsFontsIso.sh /usr/libexec/extract_fonts_from_windows_iso
chmod +x /usr/libexec/extract_fonts_from_windows_iso

chmod 644 /usr/share/applications/stop-waydroid.desktop
chmod 644 /usr/share/applications/reset-waydroid.desktop
chmod 644 /usr/share/applications/toggle-automatic-system-updates.desktop
chmod 644 /usr/share/applications/steam-big-picture-mode.desktop
chmod 644 /usr/share/applications/brew-gui.desktop
chmod 644 /usr/share/applications/looking-glass.desktop
chmod 644 /usr/share/applications/vibrant-updater.desktop

mkdir -p /usr/share/bash-completion/completions/
mkdir -p /usr/share/fish/completions/
bluebuild completions bash | tee /usr/share/bash-completion/completions/bluebuild
bluebuild completions fish | tee /usr/share/fish/completions/bluebuild.fish
chmod 644 /usr/share/fish/completions/bluebuild.fish
chmod 644 /usr/bin/bluebuild
chmod +x /usr/bin/bluebuild

git clone https://codeberg.org/vibrantleaf/brew-gui.git /opt/org.codeberg.vibrantleaf.brew-gui
mkdir -p /usr/share/org.codeberg.vibrantleaf.brew-gui/
install -Dm 644 /opt/org.codeberg.vibrantleaf.brew-gui/src/brew-gui.sh /usr/bin/brew-gui
install -Dm 644 /opt/org.codeberg.vibrantleaf.brew-gui/README.en_UK.md /usr/share/org.codeberg.vibrantleaf.brew-gui/README.en_UK.md
install -Dm 644 /opt/org.codeberg.vibrantleaf.brew-gui/LICENSE.en_UK.txt /usr/share/org.codeberg.vibrantleaf.brew-gui/LICENSE.en_UK.txt
install -Dm 644 /opt/org.codeberg.vibrantleaf.brew-gui/src/org.codeberg.vibrantleaf.brew-gui.desktop /usr/share/applications/org.codeberg.vibrantleaf.brew-gui.desktop
install -Dm 644 /opt/org.codeberg.vibrantleaf.brew-gui/assets/org.codeberg.vibrantleaf.brew-gui.svg /usr/share/icons/hicolor/scalable/apps/org.codeberg.vibrantleaf.brew-gui.svg
install -Dm 644 /opt/org.codeberg.vibrantleaf.brew-gui/assets/org.codeberg.vibrantleaf.brew-gui.png /usr/share/icons/hicolor/256x256/apps/org.codeberg.vibrantleaf.brew-gui.png

git clone https://codeberg.org/vibrantleaf/waydroid-wizard.git /opt/org.codeberg.vibrantleaf.waydroid-wizard
mkdir -p /usr/share/org.codeberg.vibrantleaf.waydroid-wizard
install -Dm 644 /opt/org.codeberg.vibrantleaf.waydroid-wizard/src/waydroid-wizard.sh /usr/bin/waydroid-wizard
install -Dm 644 /opt/org.codeberg.vibrantleaf.waydroid-wizard/LICENSE.en_UK.txt /usr/share/org.codeberg.vibrantleaf.waydroid-wizard/LICENSE.en_UK.txt
install -Dm 644 /opt/org.codeberg.vibrantleaf.waydroid-wizard/README.en_UK.md /usr/share/org.codeberg.vibrantleaf.waydroid-wizard/README.en_UK.md
install -Dm 644 /opt/org.codeberg.vibrantleaf.waydroid-wizard/src/org.codeberg.vibrantleaf.waydroid-wizard.desktop /usr/share/applications/org.codeberg.vibrantleaf.waydroid-wizard.desktop
#install -Dm 644 /opt/org.codeberg.vibrantleaf.brew-gui/assets/org.codeberg.vibrantleaf.waydroid-wizard.svg /usr/share/icons/hicolor/scalable/apps/org.codeberg.vibrantleaf.waydroid-wizard.svg
#install -Dm 644 /opt/org.codeberg.vibrantleaf.brew-gui/assets/org.codeberg.vibrantleaf.waydroid-wizard.png /usr/share/icons/hicolor/256x256/apps/org.codeberg.vibrantleaf.waydroid-wizard.png

chmod +x /usr/bin/brew-gui
chmod +x /usr/bin/waydroid-wizard
chmod +x /usr/libexec/sharkfin-waydroid-utils-reset
chmod +x /usr/libexec/sharkfin-waydroid-utils-stop

ln -sfT /usr/bin/dash /usr/bin/sh

echo "EDITOR=/usr/bin/hx" | tee -a /usr/lib/environment.d/99-environment.conf
ln -sfT /usr/bin/hx /usr/bin/helix
ln -sfT /usr/bin/hx /usr/bin/editor
chmod +x /usr/bin/helix
chmod +x /usr/bin/editor
