#!/use/bin/env bash
dnf install -y $(curl -s https://api.github.com/repos/GPUOpen-Drivers/AMDVLK/releases/latest | grep browser_download_url | cut -d '"' -f 4 | grep .x86_64.rpm)
