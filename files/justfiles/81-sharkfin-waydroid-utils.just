# Stop Waydroid
stop-waydroid:
    /usr/libexec/sharkfin-waydroid-utils-stop

# Initialise waydroid using the vanilla system type
setup-waydroid-vanilla:
    pkexec waydroid init --force \
        --system_channel https://ota.waydro.id/system \
        --vendor_channel https://ota.waydro.id/vendor \
        --system_type VANILLA
    curl -L -o ~/.cache/waydroid/F-Droid.apk.asc https://f-droid.org/F-Droid.apk.asc
    curl -L -o ~/.cache/waydroid/F-Droid.apk https://f-droid.org/F-Droid.apk
    gpg --keyserver keyserver.ubuntu.com --recv-key 37D2C98789D8311948394E3E41E7044E1DBA2E89
    gpg --verify ~/.cache/waydroid/F-Droid.apk.asc ~/.cache/waydroid/F-Droid.apk
    gpg --delete-secret-key 37D2C98789D8311948394E3E41E7044E1DBA2E89
    waydroid app install  ~/.cache/waydroid/F-Droid.apk
    rm -rf ~/.cache/waydroid

# Initialise waydroid using the gapps system type
setup-waydroid-gapps:
    pkexec waydroid init --force \
        --system_channel https://ota.waydro.id/system \
        --vendor_channel https://ota.waydro.id/vendor \
        --system_type GAPPS
    curl -L -o ~/.cache/waydroid/F-Droid.apk.asc https://f-droid.org/F-Droid.apk.asc
    curl -L -o ~/.cache/waydroid/F-Droid.apk https://f-droid.org/F-Droid.apk
    gpg --keyserver keyserver.ubuntu.com --recv-key 37D2C98789D8311948394E3E41E7044E1DBA2E89
    gpg --verify ~/.cache/waydroid/F-Droid.apk.asc ~/.cache/waydroid/F-Droid.apk
    gpg --delete-secret-key 37D2C98789D8311948394E3E41E7044E1DBA2E89
    rm -rf ~/.cache/waydroid

# 'factory reset' waydroid
reset-waydroid:
    /usr/libexec/sharkfin-waydroid-utils-reset
