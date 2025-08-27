#!/usr/bin/env bash
mkdir -p /sources
mkdir -p /usr/share/bash-completion/completions/
mkdir -p /usr/share/fish/completions/
bluebuild completions bash | tee /usr/share/bash-completion/completions/bluebuild > /dev/null
bluebuild completions fish | tee /usr/share/fish/completions/bluebuild.fish > /dev/null
echo "EDITOR=/usr/bin/hx" | tee -a /usr/lib/environment.d/99-environment.conf
echo "__GL_CONSTANT_FRAME_RATE_HINT=3" | tee -a /usr/lib/environment.d/99-environment.conf
echo "__GL_THREADED_OPTIMIZATIONS=1" | tee -a /usr/lib/environment.d/99-environment.conf
echo "DXVK_HUD=compiler" | tee -a /usr/lib/environment.d/99-environment.conf
echo "RADV_PERFTEST=aco" | tee -a /usr/lib/environment.d/99-environment.conf
echo "mesa_glthread=true" | tee -a /usr/lib/environment.d/99-environment.conf
echo "NoDisplay=true" | tee -a /usr/share/applications/Helix.desktop
ln -sfT /usr/bin/dash /usr/bin/sh
ln -sfT /usr/bin/hx /usr/bin/helix
ln -sfT /usr/bin/hx /usr/bin/editor
ln -s /usr/bin/ldconfig /usr/sbin/ldconfig
#for i in $(ls -1 /usr/bin)
#do 
#  ln -s /usr/bin/"$i" /usr/sbin/"$i"
#done
chmod 644 /usr/share/applications/com.github.vibrantleaf.sharkfin.stop-waydroid.desktop
chmod 644 /usr/share/applications/com.github.vibrantleaf.sharkfin.reset-waydroid.desktop
chmod 644 /usr/share/applications/com.github.vibrantleaf.sharkfin.toggle-automatic-system-updates.desktop
chmod 644 /usr/share/applications/com.github.vibrantleaf.sharkfin.steam-big-picture-mode.desktop
chmod 644 /usr/share/bash-completions/bluebuild
chmod 644 /usr/share/fish/completions/bluebuild.fish
chmod 644 /usr/bin/bluebuild
chmod +x /usr/bin/bluebuild
chmod +x /usr/libexec/waydroid-utils-reset
chmod +x /usr/libexec/waydroid-utils-stop
chmos +x /usr/libexec/amd-gpu-high-power-mode
chmod +x /usr/bin/helix
chmod +x /usr/bin/editor
