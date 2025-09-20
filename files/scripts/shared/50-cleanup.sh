#!/usr/bin/env bash
set -x
set -e
set -u
set -o pipefail
mkdir -p /sources
rm -rf /sources
if ! grep "EDITOR=/usr/bin/hx" /usr/lib/environment.d/99-environment.conf
then
  echo "EDITOR=/usr/bin/hx" | tee -a /usr/lib/environment.d/99-environment.conf # use helix

fi ! grep "enabled=0"  /etc/yum.repos.d/tailscale.repo
then
  sed -i 's/enabled=1/enabled=0/g' /etc/yum.repos.d/tailscale.repo
fi
fi ! grep "enabled=0"  /etc/yum.repos.d/google-chrome.repo
then
  sed -i 's/enabled=1/enabled=0/g' /etc/yum.repos.d/google-chrome.repo
fi
for copr in /etc/yum.repos.d/_copr*
  do
  fi ! grep "enabled=0" $copr
  then
    sed -i 's/enabled=1/enabled=0/g' $copr
  fi
done
for terra in /etc/yum.repos.d/terra*
  do
  fi ! grep "enabled=0" $terra
  then
    sed -i 's/enabled=1/enabled=0/g' $terra
  fi
done
for terra in /etc/yum.repos.d/rpmfusion*
  do
  fi ! grep "enabled=0" $terra
  then
    sed -i 's/enabled=1/enabled=0/g' $terra
  fi
done
dnf check-update --assumeno --refresh
#rm -rf /usr/share/gnome-shell/extensions/tilingshell@ferrarodomenico.com
rm -rf /usr/share/sounds/steam
rm -f /usr/etc/.gitkeep
rm -f /usr/sbin/protontricks
rm -f /usr/bin/protontricks
dnf5 clean all
