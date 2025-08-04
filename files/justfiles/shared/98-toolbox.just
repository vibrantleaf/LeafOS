# Setup Ubuntu Toolbox
ubuntu-toolbox:
    /usr/bin/distrobox assemble create --replace --file /usr/share/leafos/distrobox/ubuntu-toolbox.ini

# Setup Fedora Toolbox
fedora-toolbox:
    /usr/bin/distrobox assemble create --replace --file /usr/share/leafos/distrobox/fedora-toolbox.ini
