# OOBS - Out of box Setup
oobs:
    #!/use/bin/env bash
    echo "setting kernel arguments'
    pkexec rpm-ostree kargs --append="amdgpu.ppfeaturemask=0xffffffff"
    echo "getting terminal being"
    ujust bling
    echo "done"
