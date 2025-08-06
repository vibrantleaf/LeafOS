#!/usr/bin/env bash
set -x
set -e
set -u
set -o pipefail
echo "set dnf repos for bazzite kernel mods"
dnf5 -y config-manager setopt "*rpmfusion*".enabled=0
dnf5 -y copr enable bieszczaders/kernel-cachyos-addons
dnf5 -y copr enable bazzite-org/bazzite
dnf5 -y install scx-scheds
dnf5 -y swap --repo copr:copr.fedorainfracloud.org:bazzite-org:bazzite bootc bootc
dnf5 -y swap atheros-firmware atheros-firmware-20250311-1$(rpm -E %{dist})
echo "reseting dnf repos"
dnf5 -y config-manager setopt "*rpmfusion*".enabled=1
dnf5 -y copr disable bieszczaders/kernel-cachyos-addons
dnf5 -y copr disable bazzite-org/bazzite
