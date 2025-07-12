#!/usr/bin/env bash
set -x
set -e
set -u
set -o pipefail
mkdir -p /sources
git clone https://github.com/dpejoh/Adwaita-colors /sources/com.github.dpejoh.adwata-colors
find /sources/com.github.dpejoh.adwata-colors -maxdepth 1 -type f -exec rm -f {} \;
rm -rf /sources/com.github.dpejoh.adwata-colors/.git
cp -rf /sources/com.github.dpejoh.adwata-colors /usr/share/icons