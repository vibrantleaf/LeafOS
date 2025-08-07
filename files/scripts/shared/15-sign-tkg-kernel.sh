#!/usr/bin/env bash
mkdir -p /keys
if [ -n "$MOK_PRIV" ] || [ -n ${{ secrets.MOK_PRIV }} ]
then
  if [ -n ${{ secrets.MOK_PRIV }} ]
  then
    echo "secrets.MOK_PRIV is set and not empty"
    echo ${{ secrets.MOK_PRIV }} > /keys/MOK.priv
  elif [ -n ${{ MOK_PRIV }} ]
  then
    echo "MOK_PRIV is set and not empty"
    echo $MOK_PRIV > /keys/MOK.priv
  fi
else
  echo MOK_PRIV is unset or empty
  exit 1
fi
if [ -n "$MOK_DER" ]] || [ -n ${{ secrets.MOK_DER }} ]
then
  if [ -n ${{ secrets.MOK_DER }} ]
  then
    echo "secrets.MOK_DER is set and not empty"
    echo ${{ secrets.MOK_DER }} > /keys/MOK.der
  elif [ -n "$MOK_DER" ]
  then
    echo "MOK_DER is set and not empty"
    echo $MOK_DER > /keys/MOK.der
  fi
else
  echo MOK_DER is unset or empty
  exit 1
fi
for kernel_dir in /usr/lib/modules/*_tkg*
do
  version=$(basename "$kernel_dir")
  vmlinuz_path="/usr/lib/modules/$version/vmlinuz"
  echo "Signing kernel: $vmlinuz_path"
  if [ -f "$vmlinuz_path" ]
  then
    sbsign --key /keys/MOK.priv --cert /keys/MOK.der --output "$vmlinuz_path" "$vmlinuz_path"
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
