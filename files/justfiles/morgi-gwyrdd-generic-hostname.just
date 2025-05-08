# Set Generic Hostname
set-generic-hostname:
    #!/usr/bin/env bash
    echo "Setting Random Generic Hostname"
    pkexec hostnamectl hostname $(printf "DESKTOP-$(/usr/bin/tr -dc A-Z0-9 </dev/urandom | /usr/bin/head -c 7)")
    echo "This is your new Randome Generic Hostname: $(hostname)"
