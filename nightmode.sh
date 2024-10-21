#!/usr/bin/env bash

if [[ $# -eq 0 ]]; then
    echo "Requires on or off args"
    exit 1
fi

if [[ "$1" = "on" || $1 = 1 ]]; then
    sed -i 's/latte/mocha/' ~/.config/fish/config.fish 2&>/dev/null
    sed -i 's/Latte/Mocha/' ~/.config/fish/config.fish 2&>/dev/null
    sed -i 's/latte/mocha/' ~/.config/alacritty/alacritty.toml 2&>/dev/null
    sed -i 's/latte/mocha/' ~/.config/qutebrowser/config.py 2&>/dev/null
    sed -i 's/latte/mocha/' ~/.config/nvim/lua/plugins/colorscheme.lua 2&>/dev/null
    sed -i 's/latte/mocha/' ~/.config/waybar/style.css 2&>/dev/null
    sed -i 's/latte/mocha/' ~/.config/sway/config 2&>/dev/null
    sed -i 's/latte/mocha/' ~/.config/helix/config.toml 2&>/dev/null
    sed -i 's/latte/mocha/' ~/.config/zellij/config.kdl 2&>/dev/null
    sed -i 's/latte/mocha/' ~/.config/foot/foot.ini 2&>/dev/null
    echo "y" | fish -c "fish_config theme save 'Catppuccin Mocha'" 2&>/dev/null
    export BAT_THEME='Catppuccin Mocha'
    # export LS_COLORS="$(vivid generate catppuccin-mocha)"

else
    sed -i 's/mocha/latte/' ~/.config/fish/config.fish 2&>/dev/null
    sed -i 's/Mocha/Latte/' ~/.config/fish/config.fish 2&>/dev/null
    sed -i 's/mocha/latte/' ~/.config/alacritty/alacritty.toml 2&>/dev/null
    sed -i 's/mocha/latte/' ~/.config/qutebrowser/config.py 2&>/dev/null
    sed -i 's/mocha/latte/' ~/.config/nvim/lua/plugins/colorscheme.lua 2&>/dev/null
    sed -i 's/mocha/latte/' ~/.config/waybar/style.css 2&>/dev/null
    sed -i 's/mocha/latte/' ~/.config/sway/config 2&>/dev/null
    sed -i 's/mocha/latte/' ~/.config/helix/config.toml 2&>/dev/null
    sed -i 's/mocha/latte/' ~/.config/zellij/config.kdl 2&>/dev/null
    sed -i 's/mocha/latte/' ~/.config/foot/foot.ini 2&>/dev/null
    echo "y" | fish -c "fish_config theme save 'Catppuccin Latte'" 2&>/dev/null
    export BAT_THEME='Catppuccin Latte'
    # export LS_COLORS="$(vivid generate catppuccin-latte)"
fi
swaymsg reload 2&>/dev/null
fish -c "set --global hydro_color_git $fish_color_host_remote" 2&>/dev/null
