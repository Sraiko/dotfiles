#!/bin/sh

cd ~

#Installing yay AUR helper
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

cd ..

#Setting system theming configuration
cp -r dotfiles/.config ~

#Installing and theming terminal
yay -S rxvt-unicode
cp dotfiles/.Xresources ~
cp -r dotfiles/.urxvt ~

#Installing needed fonts
yay -S noto-fonts siji-ttf noto-fonts-cjk ttf-font-awesome

#Installing bash autocompletion
git clone --recursive https://github.com/akinomyoga/ble.sh.git
make -C ble.sh install PREFIX=~/.local

#Setting bash configuration
cp dotfiles/.bashrc ~

#Installing programs I use
sudo pacman -S micro nitrogen firefox rofi lutris neofetch virt-manager thunar samba gvfs-smb pulseaudio pavucontrol python-pip scrot imagemagick dunst zenity alsa-utils arandr mpv gimp seahorse polybar gnome-disk-utility arandr yarn unrar
yay -S transmission-gtk lxappearance file-roller ventoy-bin qemu ebtables steam vcodium timeshift scot 7-zip

#Setting papirus icons with catppuccin theme
yay -S papirus-icon-theme-git

sudo cp -r ~/dotfiles/usr ~

git clone https://github.com/catppuccin/papirus-folders.git
cd papirus-folders
sudo cp -r src/* /usr/share/icons/Papirus
./papirus-folders -C cat-macchiato-lavender --theme Papirus-Dark
cd ..

#Installing spotify and theming
yay -S spotify-adblock

GROUP=$USER
sudo chgrp $GROUP /opt/spotify
sudo chgrp -R $GROUP /opt/spotify/Apps
sudo chmod 775 /opt/spotify
sudo chmod 775 -R /opt/spotify/Apps

yay -S spicetify-cli

git clone https://github.com/catppuccin/spicetify.git
cd spicetify
cp -r catppuccin-macchiato ~/.config/spicetify/Themes/
cp js/catppuccin-macchiato.js ~/.config/spicetify/Extensions/
spicetify config current_theme catppuccin-macchiato
spicetify config color_scheme mauve
spicetify config inject_css 1 replace_colors 1 overwrite_assets 1
spicetify config extensions catppuccin-macchiato.js
spicetify config custom_apps marketplace-
spicetify update
cd ..

#Installing discord
sudo pacman -S flatpak

flatpak install discord
sudo flatpak override com.discordapp.Discord --filesystem=home

# Setting virt-manager permissions
sudo usermod -a -G libvirt $USER
sudo sed -i 's/user = "libvirt-qemu"/user = "$USER"/' /etc/libvirt/qemu.conf
sudo sed -i 's/group = "libvirt-qemu"/group = "$USER"/' /etc/libvirt/qemu.conf
