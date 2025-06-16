# Stop Waydroid
stop-waydroid:
    /usr/libexec/sharkfin-waydroid-utils-stop
    
# Initialise waydroid using the vanilla system type
setup-waydroid-vanilla:
    pkexec waydroid init --force \
        --system_channel https://ota.waydro.id/system \
        --vendor_channel https://ota.waydro.id/vendor \
        --system_type VANILLA

# Initialise waydroid using the gapps system type
setup-waydroid-gapps:
    pkexec waydroid init --force \
        --system_channel https://ota.waydro.id/system \
        --vendor_channel https://ota.waydro.id/vendor \
        --system_type GAPPS

# 'factory reset' waydroid
reset-waydroid:
    /usr/libexec/sharkfin-waydroid-utils-reset