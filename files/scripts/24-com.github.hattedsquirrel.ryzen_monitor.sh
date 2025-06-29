#!/usr/bin/env bash
set -x
set -e
set -u
set -o pipefail
mkdir -p /sources
git clone https://github.com/hattedsquirrel/ryzen_monitor.git /sources/com.github.hattedsquirrel.ryzen_monitor
(cd /sources/com.github.hattedsquirrel.ryzen_monitor;make)
mkdir -p /usr/share/com.github.hattedsquirrel.ryzen_monitor
mkdir -p /usr/share/licenses/com.github.hattedsquirrel.ryzen_monitor/
install -Dm 644 /sources/com.github.hattedsquirrel.ryzen_monitor/src/ryzen_monitor /usr/bin/ryzen-monitor
install -Dm 644 /sources/com.github.hattedsquirrel.ryzen_monitor/LICENSE /usr/share/licenses/com.github.hattedsquirrel.ryzen_monitor/LICENSE.txt
install -Dm 644 /sources/com.github.hattedsquirrel.ryzen_monitor/README.md /usr/share/com.github.hattedsquirrel.ryzen_monitor/README.md
chmod +x /usr/bin/ryzen-monitor
