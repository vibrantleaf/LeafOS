#!/usr/bin/env bash
echo "Downloading New Cosing Key"
curl https://raw.githubusercontent.com/vibrantleaf/LeafOS/refs/heads/main/cosign.pub | sudo tee /etc/pki/containers/{sharkfin,borealis,sharkbox,shetland}.pub > /dev/null
curl https://raw.githubusercontent.com/ublue-os/main/refs/heads/main/cosign.pub | sudo tee /etc/pki/containers/ublue-os.pub
echo "Upgrading Bootc Image"
sudo bootc upgrade
