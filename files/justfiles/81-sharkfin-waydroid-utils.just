# Stop Waydroid
stop-waydroid:
    #!/usr/bin/env bash
    /usr/libexec/sharkfin-waydroid-utils-stop

# Initialise waydroid using the vanilla system type
setup-waydroid-vanilla:
    #!/usr/bin/env bash
    (
    echo "10" ; sleep 1
    echo "Initalising Waydroid ..." ; sleep 1
    pkexec waydroid init --force \
        --system_channel https://ota.waydro.id/system \
        --vendor_channel https://ota.waydro.id/vendor \
        --system_type VANILLA
    echo "30" ; sleep 1
    echo "Downloading F-Droid ..."
    mkdir -p ~/.cache/waydroid/
    curl -Lo ~/.cache/waydroid/F-Droid.apk.asc https://f-droid.org/F-Droid.apk.asc
    curl -Lo ~/.cache/waydroid/F-Droid.apk https://f-droid.org/F-Droid.apk
    echo "30" sleep 1
    echo "Verifying F-Droid Download ..." ; sleep 1
    gpg --keyserver keyserver.ubuntu.com --recv-key 37D2C98789D8311948394E3E41E7044E1DBA2E89
    gpg --verify ~/.cache/waydroid/F-Droid.apk.asc ~/.cache/waydroid/F-Droid.apk
    echo "40" ; sleep 1
    echo "Installing F-Droid into Waydroid" ; sleep 1
    pkexec waydroid container start & > /dev/null 2>&1 
    waydroid app install  ~/.cache/waydroid/F-Droid.apk
    waydroid session stop
    echo "60" ; sleep 1
    echo "Fininshed Installing F-Droid into Waydroid" ; sleep 1
    echo "80" sleep 1
    echo "Cleaning up ..."
    gpg --delete-secret-key 37D2C98789D8311948394E3E41E7044E1DBA2E89    
    rm -rf ~/.cache/waydroid
    echo "100" ; sleep 1
    echo "Waydroid Setup Done!" ; sleep 1
    ) | zenity --progress --title="Waydroid Settup Wizard" --text="Initalising Waydroid ..." --percentage=0
    if [ "$?" = -1 ]
    then
        zenity --error --text="Waydroid Settup Canceled."
    fi

# Initialise waydroid using the gapps system type
setup-waydroid-gapps:
    #!/usr/bin/env bash
    (
    echo "10" ; sleep 1
    echo "Initalising Waydroid ..."
    pkexec waydroid init --force \
        --system_channel https://ota.waydro.id/system \
        --vendor_channel https://ota.waydro.id/vendor \
        --system_type GAPPS
    echo "20" ; sleep 1
    echo "Downloading F-Droid ..." ; sleep 1
    mkdir -p ~/.cache/waydroid/
    curl -Lo ~/.cache/waydroid/F-Droid.apk.asc https://f-droid.org/F-Droid.apk.asc
    curl -Lo ~/.cache/waydroid/F-Droid.apk https://f-droid.org/F-Droid.apk
    echo "30" ; sleep 1
    echo "Verifying F-Droid Download ..." ; sleep 1
    gpg --keyserver keyserver.ubuntu.com --recv-key 37D2C98789D8311948394E3E41E7044E1DBA2E89
    gpg --verify ~/.cache/waydroid/F-Droid.apk.asc ~/.cache/waydroid/F-Droid.apk
    echo "40" ; sleep 1
    echo "Installing F-Droid into Waydroid ..." ; sleep 1
    pkexec waydroid container start & > /dev/null 2>&1
    waydroid app install  ~/.cache/waydroid/F-Droid.apk
    echo "50" ; sleep 1
    echo "Fininshed Installing F-Droid into Waydroid"
    echo "60" ; sleep 1
    echo "Cleaning up..." ; sleep 1
    gpg --delete-secret-key 37D2C98789D8311948394E3E41E7044E1DBA2E89    
    rm -rfv ~/.cache/waydroid
    echo "100" ; sleep 1
    ) |
    zenity --progress --title="Waydroid Settup Wizard" --text="Initalising Waydroid ..." --percentage=0
    if [ "$?" = -1 ]
    then
        zenity --error --text="Waydroid Settup Canceled."
    fi
    zenity --info  --title="Waydroid Settup Wizard" --text="Read The Waydroid FAQ For How TO Get Google Play Certifcation Working Press OK After You Have Completed these step."
    xdg-open "https://docs.waydro.id/faq/google-play-certification"
    pkexec waydroid container restart & > /dev/null 2>&1
    zenity --info  --title="Waydroid Settup Wizard" --text="Waydroid Setup Done!"

# 'factory reset' waydroid
reset-waydroid:
    #!/usr/bin/env bash
    /usr/libexec/sharkfin-waydroid-utils-reset
