#!/usr/bin/env -S just --justfile
# vim: set ft=make :

# Build iso file from the image
build-iso-from-image:
    #!/usr/bin/env bash
    function sharkfin_iso {
      echo "Building sharkfin-latest.iso file"
      pkexec bluebuild generate-iso --iso-name sharkfin-latest.iso image ghcr.io/vibrantleaf/sharkfin:latest
    }
    function sharkfin_dx_iso {
      echo "Building sharkfin-dx-latest.iso file"
     pkexec bluebuild generate-iso --iso-name sharkfin-dx-latest.iso image ghcr.io/vibrantleaf/sharkfin-dx:latest
    }
    function sharkfin_nvidia_iso {
      echo "Building sharkfin-nvidia-latest.iso file"
      pkexec bluebuild generate-iso --iso-name sharkfin-nvidia-latest.iso image ghcr.io/vibrantleaf/sharkfin-nvidia:latest
    }
    function sharkfin_dx_nvidia_iso {
       echo "Building sharkfin-dx-nvidia-latest.iso file"
       pkexec bluebuild generate-iso --iso-name sharkfin-dx-nvidia-latest.iso image ghcr.io/vibrantleaf/sharkfin-dx-nvidia:latest
    }
    function sharkfin_all_iso {
      echo "Building all isos, this will take a long time"
      sharkfin_iso
      sharkfin_dx_iso
      sharkfin_nvidia_iso
      sharkfin_dx_nvidia_iso
    }
    echo "Press 1 for base sharkfin"
    echo "Press 2 for sharkfin in dev mode"
    echo "Press 3 for sharkfin with nvidia support"
    echo "Press 4 for sharkfin in dev mode with nvidia support"
    echo "Press 9 for to build all isos"
    read -n 1 -p "Your choice: " choice
    echo
    case $choice in
      1) sharkfin_iso ;;
      2) sharkfin_dx_iso ;;
      3) sharkfin_nvidia_iso ;;
      4) sharkfin_dx_nvidia_iso ;;
      9) sharkfin_all_iso ;;
      *) echo "Invalid choice. Exiting." ;;
    esac

# Build iso file from the recipe
build-iso-from-recipe:
    #!/usr/bin/env bash
    function sharkfin_iso {
      echo "Building sharkfin-latest.iso file"
      pkexec bluebuild generate-iso --iso-name sharkfin-latest.iso recipe recipe/sharkfin.recipe.yaml
    }
    function sharkfin_dx_iso {
      echo "Building sharkfin-dx-latest.iso file"
     pkexec bluebuild generate-iso --iso-name sharkfin-dx-latest.iso recipe recipe/sharkfin-dx.recipe.yaml
    }
    function sharkfin_nvidia_iso {
      echo "Building sharkfin-nvidia-latest.iso file"
      pkexec bluebuild generate-iso --iso-name sharkfin-nvidia-latest.iso recipe recipe/sharkfin-nvidia.recipe.yaml
    }
    function sharkfin_dx_nvidia_iso {
       echo "Building sharkfin-dx-nvidia-latest.iso file"
       pkexec bluebuild generate-iso --iso-name sharkfin-dx-nvidia-latest.iso recipe recipe/sharkfin-dx-nvidia.recipe.yaml
    }
    function sharkfin_all_iso {
      echo "Building all isos, this will take a long time"
      sharkfin_iso
      sharkfin_dx_iso
      sharkfin_nvidia_iso
      sharkfin_dx_nvidia_iso
    }
    echo "Press 1 for base sharkfin"
    echo "Press 2 for sharkfin in dev mode"
    echo "Press 3 for sharkfin with nvidia support"
    echo "Press 4 for sharkfin in dev mode with nvidia support"
    echo "Press 9 for to build all isos"
    read -n 1 -p "Your choice: " choice
    echo
    case $choice in
      1) sharkfin_iso ;;
      2) sharkfin_dx_iso;;
      3) sharkfin_nvidia_iso ;;
      4) sharkfin_dx_nvidia_iso ;;
      9) sharkfin_all_iso ;;
      *) echo "Invalid choice. Exiting." ;;
    esac
