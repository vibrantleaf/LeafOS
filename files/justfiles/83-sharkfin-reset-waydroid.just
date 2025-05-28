# 'factory reset' waydroid
reset-waydroid:
    echo "stopping waydroid"
    just --justfile /usr/share/bluebuild/justfiles/81-sharkfin-stop-waydroid.just stop-waydroid
    echo "removing waydroid data"
    rm -rf ~/.local/share/waydroid/data/
    echo "removing waydroid desktop files"
    rm -rf ~/.local/share/appications/waydroid.*.desktop