#!/usr/bin/env bash

rm -rf /opt/org.codeberg.vibrantleaf.vibrant-updater
rm -rf /opt/io.looking-glass.client
rm -rf /opt/com.github.vibrantleaf.sharkfin/
rm -rf /opt/org.codeberg.vibrantleaf.brew-gui
rm -rf /opt/org.bluebuild.cli/
rm -rf /opt/com.github.gist.AggamR.get_ms_fonts_from_a_windows_10_iso
rm -rf /usr/share/gnome-shell/extensions/tilingshell@ferrarodomenico.com
rm -rf /usr/share/sounds/steam
rm -rf /var/tmp/game-devices-udev
rm -rf /var/tmp/realtek-r8152-udev
rm -rf /var/tmp/android-udev-rules/
rm -f /usr/etc/.gitkeep
rm -f /usr/share/applications/com.gerbilsoft.rom-properties.rp-config.desktop
rm -f /usr/sbin/protontricks
rm -f /usr/bin/protontricks
dnf5 clean all
