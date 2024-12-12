#!/usr/bin/env fish
argparse h/help -- $argv

# failsafe conditional
if test "$(count $argv)" -ge 1
    if test $argv[1] = on
        set -U NIGHTMODE on
        set from latte
        set to mocha
        set ftheme "Catppuccin Mocha"
        sed -i s/light/dark/ ~/.scripts/shuffle_wallpaper.sh 2&>/dev/null
    else if test $argv[1] = off
        set -U NIGHTMODE off
        set from mocha
        set to latte
        set ftheme "Catppuccin Latte"
        sed -i s/dark/light/ ~/.scripts/shuffle_wallpaper.sh 2&>/dev/null
    end
else
    if test $NIGHTMODE = on
        set -U NIGHTMODE off
        set from mocha
        set to latte
        set ftheme "Catppuccin Latte"
        sed -i s/dark/light/ ~/.scripts/shuffle_wallpaper.sh 2&>/dev/null
    else
        set -U NIGHTMODE on
        set from latte
        set to mocha
        set ftheme "Catppuccin Mocha"
        sed -i s/light/dark/ ~/.scripts/shuffle_wallpaper.sh 2&>/dev/null
    end
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
sed -i "s/$from/$to/" ~/.config/hypr/hyprland.conf 2&>/dev/null &

# swaymsg reload &
echo y | fish_config theme save "$ftheme" &
set -U hydro_color_git $fish_color_host_remote

# neovim instances
for addr in $XDG_RUNTIME_DIR/nvim.*
    nvim --server $addr --remote-send ":colorscheme catppuccin-$to<CR>"
end

# qutebrowser instances
if test "$(pgrep qute)" != ""
    qutebrowser ":config-source" 2&>/dev/null
    if test $NIGHTMODE = on
        qutebrowser ":set colors.webpage.darkmode.enabled true" 2&>/dev/null
    else
        qutebrowser ":set colors.webpage.darkmode.enabled false" 2&>/dev/null
    end
end

sh ~/.scripts/shuffle_wallpaper.sh 2&>/dev/null
