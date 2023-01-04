#!/bin/sh

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