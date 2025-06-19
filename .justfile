#!/usr/bin/env -S just --justfile

# Build iso file from the image
build-iso-from-image:
    #!/usr/bin/env bash
    function sharkfin_iso {
      echo "Building sharkfin-stable.iso file"
      cosign verify --key cosign.pub ghcr.io/vibrantleaf/sharkfin:stable
      pkexec bluebuild generate-iso --iso-name iso/sharkfin-stable.iso image ghcr.io/vibrantleaf/sharkfin:stable
    }
    function sharkfin_dx_iso {
      echo "Building sharkfin-dx-stable.iso file"
      cosign verify --key cosign.pub ghcr.io/vibrantleaf/sharkfin:stable
      pkexec bluebuild generate-iso --iso-name iso/sharkfin-dx-stable.iso image ghcr.io/vibrantleaf/sharkfin-dx:stable
    }
    function sharkfin_nvidia_iso {
      echo "Building sharkfin-nvidia-stable.iso file"
      cosign verify --key cosign.pub ghcr.io/vibrantleaf/sharkfin:stable
      pkexec bluebuild generate-iso --iso-name iso/sharkfin-nvidia-stable.iso image ghcr.io/vibrantleaf/sharkfin-nvidia:stable
    }
    function sharkfin_dx_nvidia_iso {
       echo "Building sharkfin-dx-nvidia-stable.iso file"
       cosign verify --key cosign.pub ghcr.io/vibrantleaf/sharkfin:stable
       pkexec bluebuild generate-iso --iso-name iso/sharkfin-dx-nvidia-stable.iso image ghcr.io/vibrantleaf/sharkfin-dx-nvidia:stable
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
      echo "Building sharkfin-stable.iso file"
      pkexec bluebuild generate-iso --iso-name iso/sharkfin-stable.iso recipe recipes/sharkfin.recipe.yaml
    }
    function sharkfin_dx_iso {
      echo "Building sharkfin-dx-stable.iso file"
     pkexec bluebuild generate-iso --iso-name iso/sharkfin-dx-stable.iso recipe recipes/sharkfin-dx.recipe.yaml
    }
    function sharkfin_nvidia_iso {
      echo "Building sharkfin-nvidia-stable.iso file"
      pkexec bluebuild generate-iso --iso-name iso/sharkfin-nvidia-stable.iso recipe recipes/sharkfin-nvidia.recipe.yaml
    }
    function sharkfin_dx_nvidia_iso {
       echo "Building sharkfin-dx-nvidia-stable.iso file"
       pkexec bluebuild generate-iso --iso-name iso/sharkfin-dx-nvidia-stable.iso recipe recipes/sharkfin-dx-nvidia.recipe.yaml
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

# gpg sign iso file
gpg-sign-iso:
    #!/usr/bin/env bash
    function sharkfin_iso {
      echo "Signing sharkfin-stable.iso file"
      gpg --sign iso/sharkfin-stable.iso 
    }
    function sharkfin_dx_iso {
      echo "Signing sharkfin-dx-stable.iso file"
      gpg --sign iso/sharkfin-dx-stable.iso 
    }
    function sharkfin_nvidia_iso {
      echo "Signing sharkfin-nvidia-stable.iso file"
      gpg --sign iso/sharkfin-nvidia-stable.iso
    }
    function sharkfin_dx_nvidia_iso {
       echo "Signing sharkfin-dx-nvidia-stable.iso file"
       gpg --sign iso/sharkfin-dx-nvidia-stable.iso
    }
    function sharkfin_all_iso {
      echo "Signing all isos, this will take a long time"
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

# Convert Recipe file to Containerfile
recipe-to-containerfile:
    #!/usr/bin/env bash
    function sharkfin_containerfile {
      echo "Converting shakrfin Recipe file to Containerfile"
      bluebuild generate --output Conatinerfile/sharkfin.Containerfile recipes/sharkfin.recipe.yaml
    }
    function sharkfin_dx_containerfile {
      echo "Converting shakrfin-dx Recipe file to Containerfile"
      bluebuild generate --output Conatinerfile/sharkfin-dx.Containerfile recipes/sharkfin-dx.recipe.yaml
    }
    function sharkfin_nvidia_containerfile {
      echo "Converting shakrfin-nvidia Recipe file to Containerfile"
      bluebuild generate --output Conatinerfile/sharkfin-nvidia.Containerfile recipes/sharkfin-nvidia.recipe.yaml
    }
    function sharkfin_dx_nvidia_containerfile {
       echo "Converting shakrfin-dx-nvidia Recipe file to Containerfile"
       bluebuild generate --output Conatinerfile/sharkfin-dx-nvidia.Containerfile recipes/sharkfin-dx-nvidia.recipe.yaml
    }
    function sharkfin_all_containerfile {
      echo "Converting all Recipe files to Containerfiles, this will take a long time"
      sharkfin_containerfile
      sharkfin_dx_containerfile
      sharkfin_nvidia_containerfile
      sharkfin_dx_nvidia_containerfile
    }
    echo "Press 1 for base sharkfin"
    echo "Press 2 for sharkfin in dev mode"
    echo "Press 3 for sharkfin with nvidia support"
    echo "Press 4 for sharkfin in dev mode with nvidia support"
    echo "Press 9 for to generate all Containerfiles"
    read -n 1 -p "Your choice: " choice
    echo
    case $choice in
      1) sharkfin_containerfile ;;
      2) sharkfin_dx_containerfile ;;
      3) sharkfin_nvidia_containerfile ;;
      4) sharkfin_dx_nvidia_containerfile ;;
      9) sharkfin_all_containerfile ;;
      *) echo "Invalid choice. Exiting." ;;
    esac

# git pull
git-pull:
    #!/usr/bin/env bash
    git pull origin main

# git force push
git-force-push:
    #!/usr/bin/env bash
    git add .
    git commit -s -m 'Force Pushed Commit'
    git push --force origin main 
