#!/usr/bin/env bash
mkdir -p /sources
git clone https://github.com/fabiscafe/game-devices-udev.git /sources/game-devices-udev
git clone https://github.com/wget/realtek-r8152-linux.git /sources/realtek-r8152-udev
git clone https://github.com/M0Rf30/android-udev-rules.git /sources/android-udev-rules
cp -rfv /sources/game-devices-udev/*.rules /usr/share/ublue-os/udev-rules/
cp -rfv /sources/realtek-r8152-udev/*.rules /usr/share/ublue-os/udev-rules/
cp -rfv /sources/android-udev-rules/*.rules /usr/share/ublue-os/udev-rules/
chmod 644 /usr/share/ublue-os/udev-rules/*.rules