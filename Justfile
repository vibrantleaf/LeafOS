#!/usr/bin/env -S just --justfile

# Build iso file from the image
build-iso-from-image:
    #!/usr/bin/env bash
    function sharkfin_iso {
      echo "Building sharkfin-stable.iso file"
      cosign verify --key cosign.pub ghcr.io/vibrantleaf/sharkfin:stable
      sudo bluebuild generate-iso --output-dir ./iso --iso-name sharkfin-stable.iso image ghcr.io/vibrantleaf/sharkfin:stable
    }
    function sharkfin_dx_iso {
      echo "Building sharkfin-dx-stable.iso file"
      cosign verify --key cosign.pub ghcr.io/vibrantleaf/sharkfin:stable
      sudo bluebuild generate-iso --output-dir ./iso --iso-name sharkfin-dx-stable.iso image ghcr.io/vibrantleaf/sharkfin-dx:stable
    }
    function sharkfin_nvidia_iso {
      echo "Building sharkfin-nvidia-stable.iso file"
      cosign verify --key cosign.pub ghcr.io/vibrantleaf/sharkfin:stable
      sudo bluebuild generate-iso --output-dir ./iso --iso-name sharkfin-nvidia-stable.iso image ghcr.io/vibrantleaf/sharkfin-nvidia:stable
    }
    function sharkfin_dx_nvidia_iso {
       echo "Building sharkfin-dx-nvidia-stable.iso file"
       cosign verify --key cosign.pub ghcr.io/vibrantleaf/sharkfin:stable
       sudo bluebuild generate-iso --output-dir ./iso --iso-name sharkfin-dx-nvidia-stable.iso image ghcr.io/vibrantleaf/sharkfin-dx-nvidia:stable
    }
    function borealis_iso {
      echo "Building borealis-stable.iso file"
      cosign verify --key cosign.pub ghcr.io/vibrantleaf/borealis:stable
      sudo bluebuild generate-iso --output-dir ./iso --iso-name borealis-stable.iso image ghcr.io/vibrantleaf/borealis:stable
    }
    function borealis_dx_iso {
      echo "Building borealis-dx-stable.iso file"
      cosign verify --key cosign.pub ghcr.io/vibrantleaf/borealis:stable
      sudo bluebuild generate-iso --output-dir ./iso --iso-name borealis-dx-stable.iso image ghcr.io/vibrantleaf/borealis-dx:stable
    }
    function borealis_nvidia_iso {
      echo "Building borealis-nvidia-stable.iso file"
      cosign verify --key cosign.pub ghcr.io/vibrantleaf/borealis:stable
      sudo bluebuild generate-iso --output-dir ./iso --iso-name borealis-nvidia-stable.iso image ghcr.io/vibrantleaf/borealis-nvidia:stable
    }
    function borealis_dx_nvidia_iso {
       echo "Building borealis-dx-nvidia-stable.iso file"
       cosign verify --key cosign.pub ghcr.io/vibrantleaf/sharkfin:stable
       sudo bluebuild generate-iso --output-dir ./iso --iso-name borealis-dx-nvidia-stable.iso image ghcr.io/vibrantleaf/borealis-dx-nvidia:stable
    }
    function leafos_all_iso {
      echo "Building all isos, this will take a long time"
      sharkfin_isoborealis
      sharkfin_dx_isoborealis
      sharkfin_nvidia_iso
      sharkfin_dx_nvidia_iso
      borealis_iso
      borealis_dx_iso
      borealis_nvidia_iso
      borealis_dx_nvidia_iso
    }
    echo "Press 1 for base sharkfin"
    echo "Press 2 for sharkfin in dev mode"
    echo "Press 3 for sharkfin with nvidia support"
    echo "Press 4 for sharkfin in dev mode with nvidia support"
    echo "Press 5 for base Borealis"
    echo "Press 6 for Borealis with nvidia support"
    echo "Press 7 for base Borealis in dev mode"
    echo "Press 8 for Borealis in dev mode with nvidia support"
    echo "Press 9 for to build all isos"
    read -n 1 -p "Your choice: " choice
    echo
    case $choice in
      1) sharkfin_iso ;;
      2) sharkfin_dx_iso ;;
      3) sharkfin_nvidia_iso ;;
      4) sharkfin_dx_nvidia_iso ;;
      5) sharkfin_iso ;;
      6) sharkfin_dx_iso ;;
      7) sharkfin_nvidia_iso ;;
      8) sharkfin_dx_nvidia_iso ;;
      9) leafos_all_iso ;;
      *) echo "Invalid choice. Exiting." ;;
    esac

# Build iso file from the recipe
build-iso-from-recipe:
    #!/usr/bin/env bash
    function sharkfin_iso {
      echo "Building sharkfin-stable.iso file"
      sudo bluebuild generate-iso --output-dir ./iso --iso-name sharkfin-stable.iso recipe recipes/sharkfin.recipe.d/sharkfin.recipe.yaml
    }
    function sharkfin_dx_iso {
      echo "Building sharkfin-dx-stable.iso file"
      sudo bluebuild generate-iso --output-dir ./iso --iso-name sharkfin-dx-stable.iso recipe recipes/sharkfin.recipe.d/sharkfin-dx.recipe.yaml
    }
    function sharkfin_nvidia_iso {
      echo "Building sharkfin-nvidia-stable.iso file"
      sudo bluebuild generate-iso --output-dir ./iso --iso-name sharkfin-nvidia-stable.iso recipe recipes/sharkfin.recipe.d/sharkfin-nvidia.recipe.yaml
    }
    function sharkfin_dx_nvidia_iso {
       echo "Building sharkfin-dx-nvidia-stable.iso file"
       sudo bluebuild generate-iso --output-dir ./iso --iso-name sharkfin-dx-nvidia-stable.iso recipe recipes/sharkfin.recipe.d/sharkfin-dx-nvidia.recipe.yaml
    }
    function borealis_iso {
      echo "Building borealis-stable.iso file"
      sudo bluebuild generate-iso --output-dir ./iso --iso-name borealis-stable.iso recipe recipes/borealis.recipe.d/borealis.recipe.yaml
    }
    function borealis_dx_iso {
      echo "Building borealis-dx-stable.iso file"
      sudo bluebuild generate-iso --output-dir ./iso --iso-name borealis-dx-stable.iso recipe recipes/borealis.recipe.d/borealis-dx.recipe.yaml
    }
    function borealis_nvidia_iso {
      echo "Building borealis-nvidia-stable.iso file"
      sudo bluebuild generate-iso --output-dir ./iso --iso-name borealis-nvidia-stable.iso recipe recipes/borealis.recipe.d/borealis-nvidia.recipe.yaml
    }
    function borealis_dx_nvidia_iso {
       echo "Building borealis-dx-nvidia-stable.iso file"
       sudo bluebuild generate-iso --output-dir ./iso --iso-name borealis-dx-nvidia-stable.iso recipe recipes/borealis.recipe.d/borealis-dx-nvidia.recipe.yaml
    }
    function leafos_all_iso {
      echo "Building all isos, this will take a long time"
      sharkfin_iso
      sharkfin_dx_isoborealis
      sharkfin_nvidia_iso
      sharkfin_dx_nvidia_iso
      borealis_iso
      borealis_dx_iso
      borealis_nvidia_iso
      borealis_dx_nvidia_iso
    }
    echo "Press 1 for base sharkfin"
    echo "Press 2 for sharkfin in dev mode"
    echo "Press 3 for sharkfin with nvidia support"
    echo "Press 4 for sharkfin in dev mode with nvidia support"
    echo "Press 5 for base Borealis"
    echo "Press 6 for Borealis with nvidia support"
    echo "Press 7 for base Borealis in dev mode"
    echo "Press 8 for Borealis in dev mode with nvidia support"
    echo "Press 9 for to build all isos"
    read -n 1 -p "Your choice: " choice
    echo
    case $choice in
      1) sharkfin_iso ;;
      2) sharkfin_dx_iso ;;
      3) sharkfin_nvidia_iso ;;
      4) sharkfin_dx_nvidia_iso ;;
      5) sharkfin_iso ;;
      6) sharkfin_dx_iso ;;
      7) sharkfin_nvidia_iso ;;
      8) sharkfin_dx_nvidia_iso ;;
      9) leafos_all_iso ;;
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
    function borealis_iso {
       echo "Signing borealis-stable.iso file"
       gpg --sign iso/borealis-stable.iso
    }
    function borealis_dx_iso {
       echo "Signing borealis-dx-stable.iso file"
       gpg --sign iso/borealis-dx-stable.iso
    }
    function borealis_nvidia_iso {
       echo "Signing borealis-nvidia-stable.iso file"
       gpg --sign iso/borealis-nvidia-stable.iso
    }
    function borealis_dx_nvidia_iso {
       echo "Signing borealis-dx-nvidia-stable.iso file"
       gpg --sign iso/borealis-dx-nvidia-stable.iso
    }
    function sharkfin_all_iso {
      echo "Signing all isos, this will take a long time"
      sharkfin_iso
      sharkfin_dx_iso
      sharkfin_nvidia_iso
      sharkfin_dx_nvidia_iso
      borealis_iso
      borealis_dx_iso
      borealis_nvidia_iso
      borealis_dx_nvidia_iso
    }
    function leafos_all_iso {
      echo "Building all isos, this will take a long time"
      sharkfin_iso
      sharkfin_dx_isoborealis
      sharkfin_nvidia_iso
      sharkfin_dx_nvidia_iso
      borealis_iso
      borealis_dx_iso
      borealis_nvidia_iso
      borealis_dx_nvidia_iso
    }
    echo "Press 1 for base sharkfin"
    echo "Press 2 for sharkfin in dev mode"
    echo "Press 3 for sharkfin with nvidia support"
    echo "Press 4 for sharkfin in dev mode with nvidia support"
    echo "Press 5 for base Borealis"
    echo "Press 6 for Borealis with nvidia support"
    echo "Press 7 for base Borealis in dev mode"
    echo "Press 8 for Borealis in dev mode with nvidia support"
    echo "Press 9 for to build all isos"
    read -n 1 -p "Your choice: " choice
    echo
    case $choice in
      1) sharkfin_iso ;;
      2) sharkfin_dx_iso ;;
      3) sharkfin_nvidia_iso ;;
      4) sharkfin_dx_nvidia_iso ;;
      5) sharkfin_iso ;;
      6) sharkfin_dx_iso ;;
      7) sharkfin_nvidia_iso ;;
      8) sharkfin_dx_nvidia_iso ;;
      9) leafos_all_iso ;;
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
