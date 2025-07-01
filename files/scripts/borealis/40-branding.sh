#!/usr/bin/env bash
set -x
set -e
set -u
set -o pipefail
sed -i 's@bluefin@sharkfin@g' /usr/share/ublue-os/image-info.json
sed -i 's@ublue-os@vibrantleaf@g' /usr/share/ublue-os/image-info.json
sed -i 's@Bluefin@borealis@g' /usr/lib/os-release
sed -i 's@bluefin@borealis@g' /usr/lib/os-release
sed -i 's@https://projectbluefin.io@https://github.com/vibrantleaf/sharkfin@g' /usr/lib/os-release
sed -i 's@https://docs.projectbluefin.io@https://github.com/vibrantleaf/sharkfin/wiki@g' /usr/lib/os-release
sed -i 's@https://discord.b@https://github.com/vibrantleaf/sharkfin/discussions@g' /usr/lib/os-release
sed -i 's@https://github.com/ublue-os/bluefin/issues/@https://github.com/vibrantleaf/sharkfin/issues@g' /usr/lib/os-release