# extract fonts from windows.iso file
extract-fonts-from-windows-iso:
    #!/usr/bin/env bash
    echo "Please Download the 'Windows 11 Disk Image (ISO) for x64 devices'"
    xdg-open "https://www.microsoft.com/en-us/software-download/windows11"
    /usr/libexec/extract_fonts_from_windows_iso
