# Fix MangoJuice
fix-mangojuice:
    #!/usr/bin/env bash
    mkdir -p ~/.config/MangoHud/
    mkdir -p ~/.var/app/io.github.radiolamp.mangojuice/config/MangoHud/
    if ! test -f "~/.config/MangoHud/MangoHud.conf"
    then
      cp -v /usr/share/doc/mangohud/MangoHud.conf.example ~/.config/MangoHud/MangoHud.conf
    fi
    flatpak override --user --filesystem=xdg-config/MangoHud:rw io.github.radiolamp.mangojuice
    ln -s ~/.config/MangoHud/MangoHud.conf ~/.var/app/io.github.radiolamp.mangojuice/config/MangoHud/MangoHud.conf
