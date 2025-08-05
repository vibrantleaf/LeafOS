#!/usr/bin/env bash

set -xeuo pipefail

# Enable sleep then hibernation by DEFAULT!
sed -i 's/#HandleLidSwitch=.*/HandleLidSwitch=suspend-then-hibernate/g' /usr/lib/systemd/logind.conf
sed -i 's/#HandleLidSwitchDocked=.*/HandleLidSwitchDocked=suspend-then-hibernate/g' /usr/lib/systemd/logind.conf
sed -i 's/#HandleLidSwitchExternalPower=.*/HandleLidSwitchExternalPower=suspend-then-hibernate/g' /usr/lib/systemd/logind.conf
sed -i 's/#SleepOperation=.*/SleepOperation=suspend-then-hibernate suspend/g' /usr/lib/systemd/logind.conf


## yoinked from: https://github.com/ublue-os/bluefin-lts/blob/c0c8e2166cb5d0c4dd511ab3f677450c2cf8de0c/build_scripts/40-services.sh