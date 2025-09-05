# Fix Old Cosign Key Error
fix-old-cosign-key-error:
    #!/usr/bin/env bash
    echo "Downloading New Cosing Key"
    curl https://raw.githubusercontent.com/vibrantleaf/LeafOS/refs/heads/main/cosign.pub | pkexec tee /etc/pki/containers/{sharkfin,borealis,sharkbox,shetland}.pub > /dev/null
    echo "Upgrading Bootc Image"
    pkexec bootc upgrade