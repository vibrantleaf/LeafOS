#!/usr/bin/env bash
mkdir -p /keys
if ! [ -f /tmp/certs/mok.priv ]
then
    echo "MOK_PRIV is set and or empty"
    exit 1
else
  echo "MOK_PRIV is set and not empty!!"
fi
if ! [ -f /tmp/certs/mok.der ]
then
  echo "MOK_DER is set or not empty"
  exit 1
else
  echo "MOK_DER is set and not empty!!"
fi

for kernel_dir in /usr/lib/modules/*_tkg*
do
  version=$(basename "$kernel_dir")
  vmlinuz_path="/usr/lib/modules/$version/vmlinuz"
  echo "Signing kernel: $vmlinuz_path"
  if [ -f "$vmlinuz_path" ]
  then
    sbsign --key /tmp/certs/mok.priv --cert /tmp/certs/mok.der --output "$vmlinuz_path" "$vmlinuz_path"
  else
    echo "Kernel image not found: $vmlinuz_path"
  fi
  if [ -d "/usr/src/kernels/$version/scripts" ]
  then
    find "$kernel_dir" -name '*.ko' | while read mod
    do
      /usr/src/kernels/$version/scripts/sign-file sha256 "$KEY" "$CERT" "$mod"
    done
  else
    echo "Skipping module signing — headers not found for $version"
  fi
done
mkdir -p /usr/share/leafos/secure_boot_keys/
cp -v /tmp/certs/MOK.der /usr/share/leafos/secure_boot_keys/
