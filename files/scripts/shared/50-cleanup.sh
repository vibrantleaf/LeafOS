#!/usr/bin/env bash
set -x
set -e
set -u
set -o pipefail
mkdir -p /sources
rm -rf /sources
# disable any non default repos
if ! grep "enabled=0"  /etc/yum.repos.d/tailscale.repo
then
  sed -i 's/enabled=1/enabled=0/g' /etc/yum.repos.d/tailscale.repo
fi
if ! grep "enabled=0"  /etc/yum.repos.d/google-chrome.repo
then
  sed -i 's/enabled=1/enabled=0/g' /etc/yum.repos.d/google-chrome.repo
fi
for copr in /etc/yum.repos.d/_copr*
  do
  if ! grep "enabled=0" $copr
  then
    sed -i 's/enabled=1/enabled=0/g' $copr
  fi
done
for terra in /etc/yum.repos.d/terra*
  do
  if ! grep "enabled=0" $terra
  then
    sed -i 's/enabled=1/enabled=0/g' $terra
  fi
done
for fusion in /etc/yum.repos.d/rpmfusion*
  do
  if ! grep "enabled=0" $fusion
  then
    sed -i 's/enabled=1/enabled=0/g' $fusion
  fi
done
# reset dnf config
rm -fv /etc/dnf/dnf.conf
mv -v /etc/dnf/dnf.conf.backup /etc/dnf/dnf.conf
# clean dnf
dnf remove -y dnf-plugins-core
dnf check-update --assumeno --refresh
dnf clean all
# clean extras
#rm -rfv /usr/share/gnome-shell/extensions/tilingshell@ferrarodomenico.com
rm -rfv /usr/share/sounds/steam
rm -fv /usr/etc/.gitkeep
rm -fv /usr/sbin/protontricks
rm -fv /usr/bin/protontricks