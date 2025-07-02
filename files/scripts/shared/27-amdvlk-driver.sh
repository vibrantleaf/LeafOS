#!/use/bin/env bash
dnf install -y $(curl -s https://api.github.com/repos/GPUOpen-Driver/AMDVLK/releases/latest | grep "browser_download_url.*x86_64.rpm" | cut -d : -f 2,3 |tr -d \")