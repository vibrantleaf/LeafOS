#!/usr/bin/env bash
set -x
set -e
set -u
set -o pipefail
dnf5 -y copr enable bazzite-org:bazzite
dnf5 -y copr enable bazzite-org:bazzite-multilib
declare -A toswap=( \
   ["copr:copr.fedorainfracloud.org:bazzite-org:bazzite"]="wireplumber" \
   ["copr:copr.fedorainfracloud.org:bazzite-org:bazzite-multilib"]="pipewire bluez xorg-x11-server-Xwayland" \
   ["terra-extras"]="switcheroo-control" \
   ["terra-mesa"]="mesa-filesystem" \
   ["copr:copr.fedorainfracloud.org:ublue-os:staging"]="fwupd" \
   )
for repo in "${!toswap[@]}"
do
  for package in ${toswap[$repo]}
  do
    dnf5 -y swap --repo=$repo $package $package
  done
done
unset -v toswap repo package
dnf5 versionlock add \
   pipewire \
   pipewire-alsa \
   pipewire-gstreamer \
   pipewire-jack-audio-connection-kit \
   pipewire-jack-audio-connection-kit-libs \
   pipewire-libs \
   pipewire-plugin-libcamera \
   pipewire-pulseaudio \
   pipewire-utils \
   wireplumber \
   wireplumber-libs \
   bluez \
   bluez-cups \
   bluez-libs \
   bluez-obexd \
   xorg-x11-server-Xwayland \
   switcheroo-control \
   mesa-dri-drivers \
   mesa-filesystem \
   mesa-libEGL \
   mesa-libGL \
   mesa-libgbm \
   mesa-va-drivers \
   mesa-vulkan-drivers \
   fwupd \
   fwupd-plugin-flashrom \
   fwupd-plugin-modem-manager \
   fwupd-plugin-uefi-capsule-data
dnf5 -y install \
   mesa-va-drivers.i686
dnf5 -y install --enable-repo="*rpmfusion*" --disable-repo="*fedora-multimedia*" \
   libaacs \
   libbdplus \
   libbluray \
   libbluray-utils