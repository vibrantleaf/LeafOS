# OOBS - Out of box Setup
oobs:
    #!/usr/bin/env bash
    echo "setting kernel arguments'
    pkexec rpm-ostree kargs --append="amdgpu.ppfeaturemask=0xffffffff"
    echo "getting terminal being"
    ujust bling
    echo "Setting Random Generic Hostname"
    ujust set-generic-hostname
    echo done
