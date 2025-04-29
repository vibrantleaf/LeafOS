# Set Generic Hostname
set-generic-hostname:
    !/usr/bin/env bash
    pkexec hostnamectl hostname $(printf "DESKTOP-$(/usr/bin/tr -dc A-Z0-9 </dev/urandom | /usr/bin/head -c 7)")
