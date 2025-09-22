# OOBS - Out of box Setup
oobs:
    #!/usr/bin/env bash
    echo "setting kernel arguments'
    pkexec rpm-ostree kargs --append="amdgpu.ppfeaturemask=0xffffffff"
    echo "getting terminal being"
    ujust bling
    echo "Setting Random Generic Hostname"
    ujust set-generic-hostname
    echo done

# Set Generic Hostname
set-generic-hostname:
    #!/usr/bin/env bash
    echo "Setting Random Generic Hostname"
    sudo hostnamectl hostname $(printf "DESKTOP-$(/usr/bin/tr -dc A-Z0-9 </dev/urandom | /usr/bin/head -c 7)")
    echo "This is your new Randome Generic Hostname: $(hostname)"

# Run the Sharkfin Waydroid Setup Wizard
waydroid-setup-wizard:
    #!/usr/bin/env bash
    /usr/bin/waydroid-wizard

# Run Waydroid Wizard using the VANILLA system type (Advanced)
waydroid-setup-wizard-vanilla:
    #!/usr/bin/env bash
    system_type="VANILLA" /usr/bin/waydroid-wizard

# Run Waydroid Wizard using the GAPPS system type (Advanced)
waydroid-setup-wizard-gapps:
    #!/usr/bin/env bash
    system_type="GAPPS" /usr/bin/waydroid-wizard

# Run Waydroid Wizard using the FOSS system type (Advanced)
waydroid-setup-wizard-foss:
    #!/usr/bin/env bash
    system_type="FOSS" /usr/bin/waydroid-wizard

# Factory Reset Waydroid
waydroid-factory-reset:
    #!/usr/bin/env bash
    /usr/libexec/waydroid-utils-reset

# Force Stop Waydroid
waydroid-force-stop:
    #!/usr/bin/env bash
    /usr/libexec/waydroid-utils-stop

# Get Steven Black's Latest Unified Host List
get-latest-stevenblacks-unified-hosts-list:
    #!/usr/bin/env bash
    echo "Downloading Steven Black's Latest Unified Hosts list"
    curl -L -o ~/.cache/tmp-hosts.txt https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts
    echo "Backing up your old hosts file"
    pkexec cp /etc/hosts /etc/hosts.bk
    echo "Installing Steven Black's Unified Hosts list"
    pkexec "cp -fv ~/.cache/tmp-hosts /etc/hosts"
    echo "Restarting Network Manager"
    sudo systemctl restart NetworkManager.service
    echo "Cleaning Up"
    rm "~/.cache/tmp-hosts"
    echo "done"

# extract fonts from windows.iso file
extract-fonts-from-windows-iso:
    #!/usr/bin/env bash
    echo "Please Download the 'Windows 11 Disk Image (ISO) for x64 devices'"
    xdg-open "https://www.microsoft.com/en-us/software-download/windows11"
    /usr/libexec/extract_fonts_from_windows_iso

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

# Fix MangoJuice
fix-mangojuice:
    #!/usr/bin/env bash
    mkdir -p ~/.config/MangoHud/
    mkdir -p ~/.var/app/io.github.radiolamp.mangojuice/config/MangoHud/
    if ! test -f "~/.config/MangoHud/MangoHud.conf"
    then
      cat /usr/share/doc/mangohud/MangoHud.conf.example | tee ~/.config/MangoHud/MangoHud.conf > /dev/null
    fi
    flatpak override --user --filesystem=xdg-config/MangoHud:rw io.github.radiolamp.mangojuice
    ln -s ~/.config/MangoHud/MangoHud.conf ~/.var/app/io.github.radiolamp.mangojuice/config/MangoHud/MangoHud.conf

fix-old-cosign-key-error:
    #!/usr/bin/env bash
    echo "Downloading New Cosing Key"
    curl https://raw.githubusercontent.com/vibrantleaf/LeafOS/refs/heads/main/cosign.pub | pkexec tee /etc/pki/containers/{sharkfin,borealis,sharkbox,shetland}.pub > /dev/null
    curl https://raw.githubusercontent.com/ublue-os/main/refs/heads/main/cosign.pub | sudo tee /etc/pki/containers/ublue-os.pub > /dev/null
    echo "Upgrading Bootc Image"
    pkexec bootc upgrade

# Soft Reboot
soft-reboot:
    #!/usr/bin/env bash
    systemctl soft-reboot

# Setup Ubuntu Toolbox
ubuntu-toolbox:
    #!/usr/bin/env bash
    /usr/bin/distrobox assemble create --replace --file /usr/share/leafos/distrobox/ubuntu-toolbox.ini

# Setup Fedora Toolbox
fedora-toolbox:
    #!/usr/bin/env bash
    /usr/bin/distrobox assemble create --replace --file /usr/share/leafos/distrobox/fedora-toolbox.ini

# Secure Boot Key Setup:
setup-secure-boot-keys:
    #!/usr/bin/env bash
    pkexec mokutil --import /usr/share/leafos/secure_boot_keys/MOK.dir
    zenity --info --title="Secure Boot Key Setup" --text="The Secure Boot Key enrollment password is: shark"
