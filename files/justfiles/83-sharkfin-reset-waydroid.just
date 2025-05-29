# 'factory reset' waydroid
reset-waydroid:
    #!/usr/bin/env bash
    read -t 10 -p "Press Enter to continue within 10 seconds..." input
    if [ $? -ne 0 ] || [ "$input" != "" ]
    then
      echo "Exiting."
      exit 0
    fi
    echo "stopping waydroid"
    just --justfile /usr/share/bluebuild/justfiles/81-sharkfin-stop-waydroid.just stop-waydroid
    echo "removing waydroid data"
    rm -rf ~/.local/share/waydroid/data/
    echo "removing waydroid desktop files"
    rm -rf ~/.local/share/appications/waydroid.*.desktop
