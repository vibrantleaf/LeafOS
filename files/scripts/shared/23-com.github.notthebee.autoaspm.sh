#!/usr/bin/env bash
set -x
set -e
set -u
set -o pipefail
mkdir -p /sources
git clone https://github.com/notthebee/autoaspm.git /sources/com.github.notthebee.autoaspm
mkdir -p /usr/share/com.github.notthebee.autoaspm
install -Dm 644 /sources/com.github.notthebee.autoaspm/autoaspm.py /usr/bin/autoaspm
install -Dm 644 /sources/com.github.notthebee.autoaspm/README.md /usr/share/com.github.notthebee.autoaspm/README.md
chmod +x /usr/bin/autoaspm