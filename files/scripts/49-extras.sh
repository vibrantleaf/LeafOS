#!/usr/bin/env bash

#rm -fv /etc/dnf/protected.d/sudo.conf"

git clone https://github.com/vibrantleaf/sharkfin.git /opt/com.github.vibrantleaf.sharkfin
mkdir -p /usr/share/sharkfin

cp -fv /opt/com.github.vibrantleaf.sharkfin/cosign.pub /usr/share/sharkfin/cosign.pub

#sed -i 's@Exec=/usr/bin/bazzite-steam@Exec=/usr/bin/steam@g' /usr/share/applications/steam.desktop
#sed -i 's@Exec=/usr/bin/bazzite-steam-bpm@Exec=/usr/bin/steam -gamepadui@g' /usr/share/applications/steam.desktop
#sed -i 's@Exec=/usr/bin/bazzite-steam-bpm@Exec=/usr/bin/steam -gamepadui@g' /usr/share/applications/bazzite-steam-bpm.desktop

git clone https://gist.github.com/AggamR/314eaa3ef6d5488ed7ebd9eb39404390.git /opt/com.github.gist.AggamR.get_ms_fonts_from_a_windows_10_iso
install -Dm 644 /opt/com.github.gist.AggamR.get_ms_fonts_from_a_windows_10_iso/getMsFontsIso.sh /usr/libexec/extract_fonts_from_windows_iso.sh
chmod +x /usr/libexec/extract_fonts_from_windows_iso.sh

chmod 644 /usr/share/applications/stop-waydroid.desktop
chmod 644 /usr/share/applications/reset-waydroid.desktop
chmod 644 /usr/share/applications/toggle-automatic-system-updates.desktop

bluebuild completions bash | tee /usr/share/bash-completion/completions/bluebuild
chmod 644 /usr/bin/bluebuild
chmod +x /usr/bin/bluebuild


git clone https://codeberg.org/vibrantleaf/brew-gui.git /opt/org.codeberg.vibrantleaf.brew-gui
mkdir -p /usr/share/org.codeberg.vibrantleaf.brew-gui/
install -Dm 644 /opt/org.codeberg.vibrantleaf.brew-gui/brew-gui.sh /usr/bin/brew-gui
install -Dm 644 /opt/org.codeberg.vibrantleaf.brew-gui/README.en_UK.md /usr/share/org.codeberg.vibrantleaf.brew-gui/README.en_UK.md
install -Dm 644 /opt/org.codeberg.vibrantleaf.brew-gui/LICENSE.en_UK.txt /usr/share/org.codeberg.vibrantleaf.brew-gui/LICENSE.en_UK.txt
install -Dm 644 /opt/org.codeberg.vibrantleaff.brew-gui/assets/org.codeberg.vibrantleaf.brew-gui.svg /usr/share/icons/hicolor/scalable/apps/org.codeberg.vibrantleaf.brew-gui.svg
chmod +x /usr/bin/brew-gui



