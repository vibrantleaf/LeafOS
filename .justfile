#!/usr/bin/env -S just --justfile

# Build iso file from the recipe file.
build-iso-from-recipe:
    #!/usr/bin/env bash
    sudo bluebuild generate-iso --iso-name sharkfin-latest.iso recipe recipes/recipe.yml

# Build iso file from the image
build-iso-from-image:
    #!/usr/bin/env bash
    sudo bluebuild generate-iso --iso-name sharkfin-latest.iso image ghcr.io/vibrantleaf/sharkfin:latest
