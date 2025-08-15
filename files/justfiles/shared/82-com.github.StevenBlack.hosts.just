# Get Steven Black's Latest Unified Host List
get-latest-stevenblacks-unified-hosts-list:
    #!/use/bin/env bash
    echo "Downloading Steven Black's Latest Unified Hosts list"
    curl -L -o ~/.cache/tmp-hosts.txt https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts
    echo "Backing up your old hosts file"
    pkexec cp /etc/hosts /etc/hosts.bk
    echo "Installing Steven Black's Unified Hosts list"
    pkexec "cp -fv ~/.cache/tmp-hosts /etc/hosts"
    echo "getting terminal being"
    echo "done"
