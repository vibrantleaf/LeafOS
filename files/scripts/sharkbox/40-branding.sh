#!/usr/bin/env bash
set -x
set -e
set -u
set -o pipefail
sed -i 's@ublue-os@vibrantleaf@g' /usr/share/ublue-os/image-info.json
sed -i 's@https://projectbluefin.io@https://github.com/vibrantleaf/LeafOS@g' /usr/lib/os-release
sed -i 's@https://docs.projectbluefin.io@https://github.com/vibrantleaf/LeafOS/wiki@g' /usr/lib/os-release
sed -i 's@https://discord.b@https://github.com/vibrantleaf/LeafOS/discussions@g' /usr/lib/os-release
sed -i 's@https://github.com/ublue-os/bluefin/issues/@https://github.com/vibrantleaf/LeafOS/issues@g' /usr/lib/os-release
sed -i 's@universal-blue@vibrantleaf@g' /usr/lib/os-release
