#!/usr/bin/env bash
set -x
set -e
set -u
set -o pipefail
dnf5 -y install dnf5-plugins
for copr in \
   bazzite-org/bazzite \
   bazzite-org/bazzite-multilib \
   ublue-os/staging \
   ublue-os/packages \
   bazzite-org/LatencyFleX \
   bazzite-org/obs-vkcapture \
   ycollet/audinux \
   bazzite-org/rom-properties \
   bazzite-org/webapp-manager \
   hhd-dev/hhd \
   che/nerd-fonts \
   hikariknight/looking-glass-kvmfr \
   mavit/discover-overlay \
   rok/cdemu \
   lizardbyte/beta; \
do
  echo "Enabling copr: $copr"
  dnf5 -y copr enable $copr
  dnf5 -y config-manager setopt copr:copr.fedorainfracloud.org:${copr////:}.priority=98
done
unset -v copr
#dnf5 -y install --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release{,-extras}
#dnf5 -y config-manager addrepo --overwrite --from-repofile=https://pkgs.tailscale.com/stable/fedora/tailscale.repo
dnf -y config-manager setopt "*bazzite*".priority=1
dnf5 -y config-manager setopt "*akmods*".priority=2
dnf5 -y config-manager setopt "*terra*".priority=3 "*terra*".exclude="nerd-fonts topgrade"
dnf5 -y config-manager setopt "terra-mesa".enabled=true
dnf5 -y config-manager setopt "terra-nvidia".enabled=false
eval "$(/ctx/dnf5-setopt setopt '*negativo17*' priority=4 exclude='mesa-* *xone*')"
dnf5 -y config-manager setopt "*rpmfusion*".priority=5 "*rpmfusion*".exclude="mesa-*"
dnf5 -y config-manager setopt "*fedora*".exclude="mesa-* kernel-core-* kernel-modules-* kernel-uki-virt-*"
dnf5 -y config-manager setopt "*staging*".exclude="scx-scheds kf6-* mesa* mutter* rpm-ostree* systemd* gnome-shell gnome-settings-daemon gnome-control-center gnome-software libadwaita tuned*" 