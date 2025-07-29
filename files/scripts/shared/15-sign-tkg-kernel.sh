#!/usr/bin/env bash
mkdir -p /keys
echo $MOK_PRIV > /keys/MOK.priv
echo $MOK_DER > /keys/MOK.der
KEY=/keys/MOK.priv
CERT=/keys/MOK.der
for kernel_dir in /usr/lib/modules/*_tkg*
do
  version=$(basename "$kernel_dir")
  vmlinuz_path="/usr/lib/modules/$version/vmlinuz"
  echo "Signing kernel: $vmlinuz_path"
  if [ -f "$vmlinuz_path" ]
  then
    sbsign --key "$KEY" --cert "$CERT" --output "$vmlinuz_path" "$vmlinuz_path"
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
cp -v /keys/MOK.der /usr/share/leafos/secure_boot_keys/
rm -rfv /keys

