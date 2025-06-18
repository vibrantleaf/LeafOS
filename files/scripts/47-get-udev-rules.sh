 #!/usr/bin/env bash
 
git clone https://github.com/fabiscafe/game-devices-udev.git /var/tmp/game-devices-udev
git clone https://github.com/wget/realtek-r8152-linux.git /var/tmp/realtek-r8152-udev
git clone https://github.com/M0Rf30/android-udev-rules.git /var/tmp/android-udev-rules

cp -rfv /var/tmp/game-devices-udev/*.rules /usr/share/ublue-os/udev-rules/
cp -rfv /var/tmp/realtek-r8152-udev/*.rules /usr/share/ublue-os/udev-rules/
cp -rfv /var/tmp/android-udev-rules/*.rules /usr/share/ublue-os/udev-rules/
