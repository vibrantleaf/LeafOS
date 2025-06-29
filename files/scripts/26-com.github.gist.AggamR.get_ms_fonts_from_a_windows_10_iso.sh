#!/usr/bin/env bash
set -x
set -e
set -u
set -o pipefail
mkdir -p /sources
git clone https://gist.github.com/AggamR/314eaa3ef6d5488ed7ebd9eb39404390.git /sources/com.github.gist.AggamR.get_ms_fonts_from_a_windows_10_iso
install -Dm 644 /sources/com.github.gist.AggamR.get_ms_fonts_from_a_windows_10_iso/getMsFontsIso.sh /usr/libexec/extract_fonts_from_windows_iso
chmod +x /usr/libexec/extract_fonts_from_windows_iso