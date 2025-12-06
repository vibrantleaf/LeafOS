#!/usr/bin/env bash

# optimise dnf config
cat /etc/dnf/dnf.conf
cp -v /etc/dnf/dnf.conf /etc/dnf/dnf.conf.backup
if ! grep "install_weak_deps" /etc/dnf/dnf.conf
then
  echo 'install_weak_deps=false' | tee -a /etc/dnf/dnf.conf
elif grep "install_weak_deps=true" /etc/dnf/dnf.conf
then
  sed -i 's/install_weak_deps=true/install_weak_deps=false/g'
fi
if ! grep "clean_requirements_on_remove" /etc/dnf/dnf.conf
then
  echo 'clean_requirements_on_remove=true' | tee -a /etc/dnf/dnf.conf
elif grep "clean_requirements_on_remove=true" /etc/dnf/dnf.conf
then
  sed -i 's/clean_requirements_on_remove=False/clean_requirements_on_remove=true/g' /etc/dnf/dnf.conf
fi
if ! grep "fastestmirror" /etc/dnf/dnf.conf
then
  echo 'fastestmirror=true' | tee -a /etc/dnf/dnf.conf
elif grep "fastestmirror=false" /etc/dnf/dnf.conf
then
  sed -i 's/fastestmirror=false/fastestmirror=true/g' /etc/dnf/dnf.conf
fi
if ! grep "deltarpm" /etc/dnf/dnf.conf
then
  echo 'deltarpm=true' | tee -a /etc/dnf/dnf.conf
elif grep "deltarpm=false" /etc/dnf/dnf.conf
then
  sed -i 's/deltarpm=false/deltarpm=true/g' /etc/dnf/dnf.conf
fi
if ! grep "timeout" /etc/dnf/dnf.conf
then
  echo 'timeout=10' | tee -a /etc/dnf/dnf.conf
elif grep "timeout" /etc/dnf/dnf.conf
then
  sed -i 's/^timeout=.*/timeout=10/' /etc/dnf/dnf.conf
fi
if ! grep "minrate" /etc/dnf/dnf.conf
then
  echo 'minrate=50000' | tee -a /etc/dnf/dnf.conf
elif grep "minrate" /etc/dnf/dnf.conf
then
  sed -i 's/^minrate=.*/minrate=10/' /etc/dnf/dnf.conf
fi
if ! grep "installonly_limit" /etc/dnf/dnf.conf
then
  echo 'installonly_limit=10' | tee -a /etc/dnf/dnf.conf
elif grep "installonly_limit" /etc/dnf/dnf.conf
then
  sed -i 's/^installonly_limit=.*/installonly_limit=10/' /etc/dnf/dnf.conf
fi
cat /etc/dnf/dnf.conf
dnf repolist
dnf update --refresh -y
dnf install --refresh -y dnf-plugins-core
# add rpmfusion repos
dnf install --refresh -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
dnf install --refresh -y https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
ls -la /etc/yum.repos.d/
dnf install --refresh -y rpmfusion-free-release-tainted
dnf install --refresh -y rpmfusion-nonfree-release-tainted
# add terra repos
curl -fsSL 'https://github.com/terrapkg/subatomic-repos/raw/main/terra.repo' | tee /etc/yum.repos.d/terra.repo"
dnf install --refresh -y terra-release"
dnf install --refresh -y terra-release-extras
dnf install --refresh -y terra-release-mesa
dnf install --refresh -y terra-release-multimedia
for terra in /etc/yum.repos.d/terra*
do
  if ! grep "enabled=1" $terra
  then
    '0,/enabled=0/s//enabled=1/' $terra
  fi
done
# add tailscale repos
curl -fsSL https://pkgs.tailscale.com/stable/fedora/tailscale.repo | tee /etc/yum.repos.d/tailscale.repo
if ! grep "enabled=1"  /etc/yum.repos.d/tailscale.repo
then
'0,/enabled=0/s//enabled=1/' /etc/yum.repos.d/tailscale.repo
fi
# add copr repos
dnf copr enable ublue-os/packages
dnf copr enable ublue-os/akmods
dnf copr enable che/nerd-fonts
dnf copr enable varlad/zellij
dnf copr enable bieszczaders/kernel-cachyos-addons
dnf copr enable renner/staging
# optimise dnf priority list
dnf repolist
ls -lA /etc/yum.repos.d/
cat '/etc/yum.repos.d/*'
dnf config-manager --setopt=fedora.priority=59
dnf config-manager --setopt=updates.priority=55
dnf config-manager --setopt=updates-archive.priority=58
dnf config-manager --setopt=fedora-cisco-openh264.priority=57
dnf config-manager --setopt=rpmfusion-free.priority=39
dnf config-manager --setopt=rpmfusion-free-tainted.priority=37
dnf config-manager --setopt=rpmfusion-free-updates.priority=35
dnf config-manager --setopt=rpmfusion-nonfree.priority=38
dnf config-manager --setopt=rpmfusion-nonfree-updates.priority=36
dnf config-manager --setopt=rpmfusion-nonfree-tainted.priority=34
dnf config-manager --setopt=fedora-multimedia.priority=30
dnf config-manager --setopt=tailscale-stable.priority=45
dnf config-manager --setopt=terra.priority=19
dnf config-manager --setopt=terra-mesa.priority=18
dnf config-manager --setopt=terra-extras.priority=17
dnf config-manager --setopt=terra-multimedia.priority=40
dnf update --refresh -y