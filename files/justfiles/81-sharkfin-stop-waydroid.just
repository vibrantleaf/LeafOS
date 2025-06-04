# Stop Waydroid
stop-waydroid:
    #!/usr/bin/env bash
    read -t 10 -p "Press Enter to continue within 10 seconds..." input
    if [ $? -ne 0 ] || [ "$input" != "" ]
    then
      echo "Exiting."
      exit 0
    fi
    sudo waydroid session stop
    sudo waydroid container stop
