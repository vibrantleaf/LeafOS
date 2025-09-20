#!/usr/bin/env bash
mkdir -p /sources
mkdir -p /usr/share/bash-completion/completions/
mkdir -p /usr/share/fish/completions/
if ! [ -f /usr/share/bash-completion/completions/bluebuild ]
then
  bluebuild completions bash | tee /usr/share/bash-completion/completions/bluebuild > /dev/null
fi
if ! [ -f /usr/share/fish/completions/bluebuild.fish ]
then
  bluebuild completions fish | tee /usr/share/fish/completions/bluebuild.fish > /dev/null
fi
touch /usr/lib/environment.d/99-environment.conf
#edit envvaars
if ! grep "EDITOR=/usr/bin/hx" /usr/lib/environment.d/99-environment.conf
then
  echo "EDITOR=/usr/bin/hx" | tee -a /usr/lib/environment.d/99-environment.conf # use helix
fi
if ! grep "__GL_CONSTANT_FRAME_RATE_HINT=3"  /usr/lib/environment.d/99-environment.conf
then
  echo "__GL_CONSTANT_FRAME_RATE_HINT=3" | tee -a /usr/lib/environment.d/99-environment.conf # fixed steam not launching now and then on f42
fi
if ! grep "__GL_THREADED_OPTIMIZATIONS=1"  /usr/lib/environment.d/99-environment.conf
then
  echo "__GL_THREADED_OPTIMIZATIONS=1" | tee -a /usr/lib/environment.d/99-environment.conf # might remove in future
fi
if ! grep "DXVK_HUD=compiler"  /usr/lib/environment.d/99-environment.conf
then
  echo "DXVK_HUD=compiler" | tee -a /usr/lib/environment.d/99-environment.conf # just usefull
fi
if ! grep "RADV_PERFTEST=aco"  /usr/lib/environment.d/99-environment.conf
then
  echo "RADV_PERFTEST=aco" | tee -a /usr/lib/environment.d/99-environment.conf # this shouldnt be nessary but wont hurt
fi
if ! grep "mesa_glthread=true"  /usr/lib/environment.d/99-environment.conf
then
  echo "mesa_glthread=true" | tee -a /usr/lib/environment.d/99-environment.conf # makes sure that opengl is multithreaded
fi
#if ! grep "MANGOHUD_CONFIGFILE=~/.config/MangoHud/MangoHud.conf" /usr/lib/environment.d/99-environment.conf
#then
#  #echo "MANGOHUD_CONFIGFILE=~/.config/MangoHud/MangoHud.conf" | tee /usr/lib/environment.d/99-environment.conf # Make sure that MangoHud uses the correct MangoHud Config will be uncomented when f43 releases
#fi
# edit .desktop files
if ! grep "NoDisplay=true" /usr/share/applications/Helix.desktop
then
  echo "NoDisplay=true" | tee -a /usr/share/applications/Helix.desktop
fi
# edit bazaar blocklist
if ! grep -Fxq "com.valvesoftware.Steam" /usr/share/ublue-os/bazaar/blocklist.txt
then
  echo"com.valvesoftware.Steam" | tee -a /usr/share/ublue-os/bazaar/blocklist.txt
fi
if ! grep -Fxq "org.dupot.easyflatpak" | tee -a /usr/share/ublue-os/bazaar/blocklist.txt
then
echo "org.dupot.easyflatpak" | tee -a /usr/share/ublue-os/bazaar/blocklist.txt
fi
if ! grep -Fxq "org.gnome.Boxes" /usr/share/ublue-os/bazaar/blocklist.txt
then
echo "org.gnome.Boxes" | tee -a /usr/share/ublue-os/bazaar/blocklist.txt
fi
if ! grep -Fxq "org.gnome.Boxes.Extension.OsinfoDb" /usr/share/ublue-os/bazaar/blocklist.txt
then
echo "org.gnome.Boxes.Extension.OsinfoDb" | tee -a /usr/share/ublue-os/bazaar/blocklist.txt
fi
if ! grep -Fxq "rip2" /usr/share/ublue-os/homebrew/bluefin-cli.Brewfile
then
  echo 'brew "rip2"' | tee -a /usr/share/ublue-os/homebrew/bluefin-cli.Brewfileecho '/bin/nu' | tee -a /usr/etc/shells
fi
if ! grep -Fx "zellij" /usr/share/ublue-os/homebrew/bluefin-cli.Brewfile
then
  echo 'brew "zellij"' | tee -a /usr/share/ublue-os/homebrew/bluefin-cli.Brewfile
fi
if ! grep -Fxq "nnn" /usr/share/ublue-os/homebrew/bluefin-cli.Brewfile
then
  echo 'brew "nnn"' | tee -a /usr/share/ublue-os/homebrew/bluefin-cli.Brewfile
fi
if ! grep -Fxq "dua-cli" /usr/share/ublue-os/homebrew/bluefin-cli.Brewfile
then
  echo 'brew "dua-cli"' | tee -a /usr/share/ublue-os/homebrew/bluefin-cli.Brewfile
fi
if ! grep -Fxq "difftastic" /usr/share/ublue-os/homebrew/bluefin-cli.Brewfile
then
  echo 'brew "difftastic"' | tee -a /usr/share/ublue-os/homebrew/bluefin-cli.Brewfile
fi
if ! grep -Fxq "carapace" /usr/share/ublue-os/homebrew/bluefin-cli.Brewfile
then
  echo 'brew "carapace"' | tee -a /usr/share/ublue-os/homebrew/bluefin-cli.Brewfile
fi
if ! grep -Fxq "/bin/nu" /etc/shells
then
  echo '/bin/nu' | tee -a /etc/shells
fi
if ! grep -Fxq "/usr/bin/nu" /etc/shells
then
  echo '/usr/bin/nu' | tee -a /etc/shells
fi
ln -sfT /usr/bin/dash /usr/bin/sh
ln -sfT /usr/bin/hx /usr/bin/helix
ln -sfT /usr/bin/hx /usr/bin/editor 
ln -s /usr/bin/ldconfig /usr/sbin/ldconfig #fix for some video games, should be not needed anymore since the bin-sbin merge in f42 will be removed when f43 releases
chmod 644 /usr/share/applications/com.github.vibrantleaf.LeafOS.stop-waydroid.desktop
chmod 644 /usr/share/applications/com.github.vibrantleaf.LeafOS.reset-waydroid.desktop
chmod 644 /usr/share/applications/com.github.vibrantleaf.LeafOS.toggle-automatic-system-updates.desktop
chmod 644 /usr/share/applications/com.github.vibrantleaf.LeafOS.steam-big-picture-mode.desktop
chmod 644 /usr/share/bash-completions/bluebuild
chmod 644 /usr/share/fish/completions/bluebuild.fish
chmod 644 /usr/bin/bluebuild
chmod +x /usr/bin/bluebuild
chmod +x /usr/libexec/waydroid-utils-reset
chmod +x /usr/libexec/waydroid-utils-stop
chmos +x /usr/libexec/amd-gpu-high-power-mode
chmod +x /usr/bin/helix
chmod +x /usr/bin/editor
