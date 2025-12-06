#!/usr/bin/env bash
set -x
set -e
set -u
set -o pipefail
mkdir -p /sources
rm -rf /sources
# disable any non default repos
dnf config-manager --setopt=fedora.enabled=1
dnf config-manager --setopt=updates.enabled=1
dnf config-manager --setopt=updates-archive.enabled=0
dnf config-manager --setopt=fedora-cisco-openh264.enabled=0
dnf config-manager --setopt=rpmfusion-free.enabled=0
dnf config-manager --setopt=rpmfusion-free-tainted.enabled=0
dnf config-manager --setopt=rpmfusion-free-updates.enabled=0
dnf config-manager --setopt=rpmfusion-nonfree.enabled=0
dnf config-manager --setopt=rpmfusion-nonfree-updates.enabled=0
dnf config-manager --setopt=rpmfusion-nonfree-tainted.enabled=0
dnf config-manager --setopt=fedora-multimedia.enabled=0
dnf config-manager --setopt=tailscale-stable.enabled=0
dnf config-manager --setopt=terra.enabled=0
dnf config-manager --setopt=terra-mesa.enabled=0
dnf config-manager --setopt=terra-extras.enabled=0
dnf config-manager --setopt=terra-multimedia.enabled=0
# reset dnf config
rm -fv /etc/dnf/dnf.conf
mv -v /etc/dnf/dnf.conf.backup /etc/dnf/dnf.conf
# clean dnf
dnf check-update --assumeno --refresh
dnf clean all
# clean extras
#rm -rfv /usr/share/gnome-shell/extensions/tilingshell@ferrarodomenico.com
rm -rfv /usr/share/sounds/steam
rm -fv /usr/etc/.gitkeep
rm -fv /usr/sbin/protontricks
rm -fv /usr/bin/protontricks