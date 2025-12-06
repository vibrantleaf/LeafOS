#!/usr/bin/env bash
curl -s https://api.github.com/repos/TibixDev/winboat/releases/latest \
  | grep "browser_download_url" \
  | cut -d '"' -f 4 \
  | grep .rpm \
  | grep x86_64 \
  | xargs -n 1 \
  curl -s -S -L -o \
  /sources/winboat.x86_64.rpm
dnf install -y /sources/winboat.x86_64.rpm