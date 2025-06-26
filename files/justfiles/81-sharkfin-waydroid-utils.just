# Stop Waydroid
stop-waydroid:
    #!/usr/bin/env bash
    /usr/libexec/sharkfin-waydroid-utils-stop

# Initialise waydroid using the vanilla system type
setup-waydroid-vanilla:
    #!/usr/bin/env bash
    echo "Initalising Waydroid"
    pkexec waydroid init --force \
        --system_channel https://ota.waydro.id/system \
        --vendor_channel https://ota.waydro.id/vendor \
        --system_type VANILLA
    echo "Downloading F-Droid"
    mkdir -p ~/.cache/waydroid/
    curl -Lo ~/.cache/waydroid/F-Droid.apk.asc https://f-droid.org/F-Droid.apk.asc
    curl -Lo ~/.cache/waydroid/F-Droid.apk https://f-droid.org/F-Droid.apk
    echo "Verifying F-Droid Download"
    gpg --keyserver keyserver.ubuntu.com --recv-key 37D2C98789D8311948394E3E41E7044E1DBA2E89
    gpg --verify ~/.cache/waydroid/F-Droid.apk.asc ~/.cache/waydroid/F-Droid.apk
    echo "Installing F-Droid into Waydroid"
    waydroid session start & > /dev/null 2>&1 
    sleep 5
    waydroid app install  ~/.cache/waydroid/F-Droid.apk
    sleep 5
    waydroid session stop
    echo "Fininshed Installing F-Droid into Waydroid"
    echo "Cleaning up"
    gpg --delete-secret-key 37D2C98789D8311948394E3E41E7044E1DBA2E89    
    rm -rfv ~/.cache/waydroid
    echo "Done"

# Initialise waydroid using the gapps system type
setup-waydroid-gapps:
    #!/usr/bin/env bash
    echo "Initalising Waydroid"
    pkexec waydroid init --force \
        --system_channel https://ota.waydro.id/system \
        --vendor_channel https://ota.waydro.id/vendor \
        --system_type GAPPS
    echo "Downloading F-Droid"
    mkdir -p ~/.cache/waydroid/
    curl -Lo ~/.cache/waydroid/F-Droid.apk.asc https://f-droid.org/F-Droid.apk.asc
    curl -Lo ~/.cache/waydroid/F-Droid.apk https://f-droid.org/F-Droid.apk
    echo "Verifying F-Droid Download"
    gpg --keyserver keyserver.ubuntu.com --recv-key 37D2C98789D8311948394E3E41E7044E1DBA2E89
    gpg --verify ~/.cache/waydroid/F-Droid.apk.asc ~/.cache/waydroid/F-Droid.apk
    echo "Installing F-Droid into Waydroid"
    waydroid session start & > /dev/null 2>&1 
    sleep 5
    waydroid app install  ~/.cache/waydroid/F-Droid.apk
    sleep 5
    waydroid session stop
    echo "Fininshed Installing F-Droid into Waydroid"
    echo "Cleaning up"
    gpg --delete-secret-key 37D2C98789D8311948394E3E41E7044E1DBA2E89    
    rm -rfv ~/.cache/waydroid
    echo "Done"


# 'factory reset' waydroid
reset-waydroid:
    #!/usr/bin/env bash
    /usr/libexec/sharkfin-waydroid-utils-reset
