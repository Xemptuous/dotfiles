# uwsm check may-start
# if test $status -eq 0
#     exec uwsm start hyprland.desktop
# end
if test (tty) = /dev/tty1
    #sway
    hyprland
end

set fish_greeting

source ~/.creds.sh
source ~/.config/fish/exports.fish
source ~/.config/fish/aliases.fish

# man colors
set -g man_blink -o red
set -g man_bold -o blue
set -g man_standout -b black red
set -g man_underline -u red

# hydro prompt colors
set --global hydro_color_git $fish_color_host_remote
#set --global hydro_color_pwd 7287fd
set --global hydro_multiline true

# valgrind fix
set -x DEBUGINFOD_URLS "https://debuginfod.archlinux.org"

# Commands to run in interactive sessions can go here
if status is-interactive
    # pyenv
    set -Ux PYENV_ROOT $HOME/.pyenv
    fish_add_path $HOME/.local/bin
    fish_add_path $HOME/.local/share/nvim/mason/bin

    if type -q pyenv
        fish_add_path $PYENV_ROOT/bin
        pyenv init - | source
    end

    fish_vi_key_bindings

    set fish_cursor_default block
    set fish_cursor_replace_one underscore
    set fish_cursor_replace underscore
    set fish_cursor_external block # line
    set fish_cursor_visual block
    set fish_cursor_visual block # line
    set fish_cursor_insert block # line
    fish_default_key_bindings -M insert
    fish_vi_key_bindings --no-erase insert
    bind --mode insert jk 'if commandline -P; commandline -f cancel; else; set fish_bind_mode default; commandline -f backward-char force-repaint; end'
end
