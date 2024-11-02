#!/usr/bin/env fish

if test "$NIGHTMODE" = on
    set from mocha
    set to latte
    set ftheme "Catppuccin Latte"
    set -U NIGHTMODE off
else
    set from latte
    set to mocha
    set ftheme "Catppuccin Mocha"
    set -U NIGHTMODE on
end

sed -i "s/$from/$to/" ~/.config/fish/config.fish 2&>/dev/null &
sed -i "s/$from/$to/" ~/.config/alacritty/alacritty.toml 2&>/dev/null &
sed -i "s/$from/$to/" ~/.config/qutebrowser/config.py 2&>/dev/null &
sed -i "s/$from/$to/" ~/.config/nvim/lua/plugins/colorscheme.lua 2&>/dev/null &
sed -i "s/$from/$to/" ~/.config/waybar/style.css 2&>/dev/null &
sed -i "s/$from/$to/" ~/.config/sway/config 2&>/dev/null &
sed -i "s/$from/$to/" ~/.config/helix/config.toml 2&>/dev/null &
sed -i "s/$from/$to/" ~/.config/zellij/config.kdl 2&>/dev/null &
sed -i "s/$from/$to/" ~/.config/foot/foot.ini 2&>/dev/null &
swaymsg reload &
echo y | fish_config theme save "$ftheme" &
set -U hydro_color_git $fish_color_host_remote
