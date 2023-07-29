#!/bin/sh

cd ~

#Installing paru AUR helper
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

cd ..

#Setting system theming configuration
sudo cp -r dotfiles/.config ~

sudo sed -i "s/noi/$USER/g" .config/nitrogen/bg-saved.cfg

#Setting screen layout
cp -r dotfiles/.screenlayout ~

#Installing and theming terminal
paru -S rxvt-unicode
cp dotfiles/.Xresources ~
cp -r dotfiles/.urxvt ~

#Installing needed fonts
paru -S noto-fonts siji-ttf noto-fonts-cjk noto-fonts-emoji ttf-font-awesome bdf-unifont ttf-iosevka-nerd ttf-sourcecodepro-nerd ttf-dejavu-sans-code

#Installing bash autocompletion
git clone --recursive https://github.com/akinomyoga/ble.sh.git
make -C ble.sh install PREFIX=~/.local

#Setting bash configuration
cp dotfiles/.bashrc ~
cp dotfiles/.git-prompt.sh ~

#Installing programs I use
sudo pacman -S micro exa nitrogen firefox rofi lutris neofetch virt-manager thunar samba gvfs-smb pavucontrol python-pip scrot imagemagick dunst zenity alsa-utils arandr mpv gimp seahorse polybar gnome-disk-utility arandr yarn unrar picom
paru -S transmission-gtk file-roller ventoy-bin qemu-base ebtables steam vscodium timeshift 7-zip spotify-adblock

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

#Setting papirus icons with catppuccin theme
paru -S catppuccin-gtk-theme-macchiato papirus-icon-theme-git oranchelo-icon-theme-git
# sudo cp -r ~/dotfiles/usr ~

git clone https://github.com/catppuccin/papirus-folders.git
cd papirus-folders
sudo cp -r src/* /usr/share/icons/Papirus
./papirus-folders -C cat-macchiato-lavender --theme Papirus-Dark
cd ..

cp -r dotfiles/Wallpapers ~

#Execute themeSpotify.sh after opening spotify and login in

# Setting virt-manager permissions
sudo sed -i -e '/unix_sock_group/s/^#//' -e '/unix_sock_rw_perms/s/^#// /etc/libvirt/libvirtd.conf'

sudo usermod -a -G libvirt $USER
sudo sed -i "s/libvirt-qemu/$USER/g" /etc/libvirt/qemu.conf

sudo rm -r ~/ble.sh ~/paru ~/papirus-folders
