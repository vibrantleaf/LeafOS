#!/usr/bin/env bash
set -x
set -e
set -u
set -o pipefail
echo 'brew "rip2"' | tea -a /usr/share/ublue-os/homebrew/bluefin-cli.Brewfile
echo 'brew "zellij"' | tea -a /usr/share/ublue-os/homebrew/bluefin-cli.Brewfile
echo 'brew "zellij"' | tea -a /usr/share/ublue-os/homebrew/bluefin-cli.Brewfile
echo 'brew "nnn"' | tea -a /usr/share/ublue-os/homebrew/bluefin-cli.Brewfile
echo 'brew "dua-cli"' | tea -a /usr/share/ublue-os/homebrew/bluefin-cli.Brewfile
echo 'brew "difftastic"' | tea -a /usr/share/ublue-os/homebrew/bluefin-cli.Brewfile
echo 'brew "carapace"' | tea -a /usr/share/ublue-os/homebrew/bluefin-cli.Brewfile
