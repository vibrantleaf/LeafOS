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
dnf install --refresh -y --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release
dnf install --refresh -y terra-release-extras
#dnf install --refresh -y terra-release-mesa
dnf install --refresh -y terra-release-multimedia
# add tailscale repos
curl -fsSL https://pkgs.tailscale.com/stable/fedora/tailscale.repo | tee /etc/yum.repos.d/tailscale.repo
if ! grep "enabled=1"  /etc/yum.repos.d/tailscale.repo
then
  sed -i '0,/enabled=0/s//enabled=1/' /etc/yum.repos.d/tailscale.repo
fi
# add copr repos
dnf copr enable ublue-os/packages
dnf copr enable ublue-os/akmods
dnf copr enable che/nerd-fonts
dnf copr enable varlad/zellij
dnf copr enable bieszczaders/kernel-cachyos-addons
dnf copr enable renner/staging
# optimise dnf priority list
sed -i 's/^priority=.*/priority=59/' /etc/yum.repos.d/fedora.repo
sed -i 's/^priority=.*/priority=55/' /etc/repos.d/fedora-updates.repo
sed -i 's/^priority=.*/priority=58/' /etc/repos.d/fedora-updates-archive.repo
sed -i 's/^priority=.*/priority=57/' /etc/repos.d/fedora-cisco-openh264.repo
sed -i 's/^priority=.*/priority=39/' /etc/repos.d/rpmfusion-free.repo
sed -i 's/^priority=.*/priority=37/' /etc/repos.d/rpmfusion-free-tainted.repo
sed -i 's/^priority=.*/priority=38/' /etc/repos.d/rpmfusion-free-updates.repo
sed -i 's/^priority=.*/priority=38/' /etc/repos.d/rpmfusion-nonfree.repo
sed -i 's/^priority=.*/priority=37/' /etc/repos.d/rpmfusion-nonfree-tainted.repo
sed -i 's/^priority=.*/priority=36/' /etc/repos.d/rpmfusion-nonfree-updates.repo
sed -i 's/^priority=.*/priority=35/' /etc/repos.d/rpmfusion-nonfree-steam.repo
sed -i 's/^priority=.*/priority=30/' /etc/repos.d/negativo17-fedora-multimedia.repo
sed -i 's/^priority=.*/priority=70/' /etc/repos.d/google-chrome.repo
sed -i 's/^priority=.*/priority=71/' /etc/repos.d/tailscale.repo
sed -i 's/^priority=.*/priority=94/' /etc/repos.d/_copr:copr.fedorainfracloud.org:che:nerd-fonts.repo
sed -i 's/^priority=.*/priority=93/' /etc/repos.d/_copr:copr.fedorainfracloud.org:phracek:PyCharm.repo
sed -i 's/^priority=.*/priority=91/' /etc/repos.d/_copr:copr.fedorainfracloud.org:ublue-os:packages.repo
sed -i 's/^priority=.*/priority=92' /etc/repos.d/_copr:copr.fedorainfracloud.org:ublue-os:staging.repo
sed -i 's/^priority=.*/priority=90/' /etc/repos.d/_copr_ublue-os-akmods.repo
sed -i 's/^priority=.*/priority=11/' /etc/yum.repos.d/terra.repo
sed -i 's/^priority=.*/priority=13/' /etc/yum.repos.d/terra-extras.repo
sed -i 's/^priority=.*/priority=12/' /etc/yum.repos.d/terra-mesa.repo
sed -i 's/^priority=.*/priority=40/' /etc/yum.repos.d/terra-multimedia.repo
sed -i '0,/enabled=1/s//enabled=0/' /etc/repos.d/rpmfusion-free-updates-testing.repo
sed -i '0,/enabled=1/s//enabled=0/' /etc/repos.d/rpmfusion-nonfree-nvidia-driver.repo
sed -i '0,/enabled=1/s//enabled=0/' /etc/repos.d/rpmfusion-nonfree-updates-testing.repo
sed -i '0,/enabled=1/s//enabled=0/' /etc/repos.d/rpmfusion-nonfree-nvidia-driver.repo
sed -i '0,/enabled=1/s//enabled=0/' /etc/repos.d/rpmfusion-nonfree-updates-testing.repo
sed -i '0,/enabled=1/s//enabled=0/' /etc/repos.d/fedora-updates-testing.repo
dnf update --refresh -y