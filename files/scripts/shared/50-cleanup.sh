#!/usr/bin/env bash
set -x
set -e
set -u
set -o pipefail
mkdir -p /sources
rm -rf /sources
rm -rf /usr/share/gnome-shell/extensions/tilingshell@ferrarodomenico.com
rm -rf /usr/share/sounds/steam
rm -f /usr/etc/.gitkeep
rm -f /usr/sbin/protontricks
rm -f /usr/bin/protontricks
dnf5 clean all
