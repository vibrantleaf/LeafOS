#!/use/bin/env bash
curl -L -O /sources/amdvlk-latest.rpm $(curl -s https://api.github.com/repos/GPUOpen-Drivers/AMDVLK/releases/latest | grep browser_download_url | cut -d '"' -f 4 | grep .x86_64.rpm)
dnf install -y /sources/amdvlk-latest.rpm
