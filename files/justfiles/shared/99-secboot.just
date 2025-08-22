# Secure Boot Key Setup:
setup-secure-boot-keys:
    #!/usr/bin/env bash
    pkexec mokutil --import /usr/share/leafos/secure_boot_keys/MOK.dir
    zenity --info --title="Secure Boot Key Setup" --text="The Secure Boot Key enrollment password is: shark"
