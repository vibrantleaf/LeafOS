# Setup ClamAV
setup-clamav:
    #!/usr/bin/env bash
    echo "Running Presetup Steps"
    sudo $(mkdir -p /var/lib/clamav && chown -R 954:954 /var/lib/clamav)
    echo "Running Freshclam"
    sudo freshclam
    echo "You Can Now Use clamscan to use clamav from the command line"
    read -p "Press Enter To Install ClamTK A ClamAV GUI From Flathub or Press Control+C to Exit."
    flatpak install flathub com.gitlab.davem.ClamTk
    echo "Done."
