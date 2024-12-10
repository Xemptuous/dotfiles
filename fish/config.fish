if test (tty) = /dev/tty1
    #sway
    hyprland
end

set fish_greeting

source ~/.creds.sh

# man colors
set -g man_blink -o red
set -g man_bold -o blue
set -g man_standout -b black red
set -g man_underline -u red

function cd
    builtin cd $argv && ls
end

export EDITOR=nvim
export VISUAL=nvim
export GCM_CREDENTIAL_STORE=cache
export RIPGREP_CONFIG_PATH="$HOME/.config/ripgrep/.ripgreprc"
# export MANPAGER="sh -c 'col -bx | bat -l man -p'"
# export MANROFFOPT="-c"
export BAT_THEME="catppuccin_mocha"
export BAT_PAGER="less"
export EZA_COLORS="da=38;5;240"
# export LS_COLORS="$(vivid generate catppuccin-mocha)"

# Aliases
# eza
alias l="eza -1 --icons --color=always $argv"
alias ls="eza --icons --color=always $argv"
alias la="eza -a --icons --color=always $argv"
alias lc="eza -1 --icons=never --color=never $argv"
alias lca="eza -1a --icons=never --color=never $argv"
alias ld="eza -D --icons --color=always $argv"
alias ll="eza -l --icons --git --color=always --no-user --time-style long-iso $argv"
alias lla="eza -la --icons --git --color=always --time-style long-iso $argv"
alias lS="eza -las size --icons --git --color=always --no-user --time-style long-iso --total-size $argv"
alias lSd="eza -lDas size --icons --git --color=always --no-user --time-style long-iso --total-size $argv"
alias l2="eza -TL 2 --icons --git --color=always --no-user --time-style long-iso $argv"
alias l3="eza -TL 3 --icons --git --color=always --no-user --time-style long-iso $argv"

# bat
#alias bat="bat --color=always $argv"
alias less="bat --color=always $argv"

# fzf
alias ff="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
alias fv="nvim \$(fzf --preview 'bat --style=numbers --color=always --line-range :500 {}')"
alias fcd="cd \$(dirname ./\$(fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'))"

alias md="mkdir -p $argv"
alias rd="rmdir $argv"

alias python="python3 $argv"
alias py="python3 $argv"

alias cpwd="pwd | tr -d '\n' | pbcopy && echo 'pwd copied to clipboard'"
alias mp3-edit="id3v2 $argv"

# Editors
alias nv="nvim $argv"
alias nvi="nvim -u $HOME/.config/nvim/vi.lua $argv"
alias nvdb="nvim '+:DBUI'"
alias nvsql="nvim '+:SQLua'"
alias nvdbee="nvim '+:lua require(\"dbee\").open()'"
alias vi="nvim --clean $argv"
alias nvs="nvim -u $HOME/.config/nvim/simple.lua $argv"
alias hx="helix"

alias zj="zellij"
alias rs="rust-script"

# Git
alias gfa="git fetch --all --prune --jobs=10"
alias gm="git merge"
alias gma="git merge --abort"
alias gmc="git merge --continue"
alias gl="git pull"
alias gp="git push"
alias gst="git status"
alias gss="git status --short"
alias gsb="git status --short --branch"
alias gsi="git submodule init"
alias gsu="git submodule update"
alias grs="git restore"
alias grst="git restore --staged"
alias gwt="git worktree"
alias gwta="git worktree add"
alias gwtrm="git worktree remove"
alias gd="git diff"
alias gdca="git diff --cached"
alias gdcw="git diff --cached --worth-diff"
alias gds="git diff --staged"
alias gdw="git diff --word-diff"
alias gcam="git commit --all --message"
alias gcas="git commit --all --signoff"
alias gcasm="git commit --all --signoff --message"
alias gcs="git commit --gpg-sign"
alias gcss="git commit --gpg-sign --signoff"
alias gcssm="git commit --gpg-sign --signoff --message"
alias gcmsg="git commit --message"
alias gcsm="git commit --signoff --message"
alias gc="git commit --verbose"
alias gca="git commit --verbose --all"

alias tard="tar_peek $argv"
alias open="xdg-open $argv"

alias shutdown="systemctl poweroff"
alias reboot="systemctl reboot"

# hydro prompt colors
set --global hydro_color_git $fish_color_host_remote
#set --global hydro_color_pwd 7287fd
set --global hydro_multiline true

function bathelp
    command bat --plain --language=help $argv
end
function help
    $argv --help 2>&1 | bathelp
end

# mimics bash's !!
function last_history_item
    echo $history[1]
end
abbr -a !! --position anywhere --function last_history_item

# use $__ to "sorta" mimic bash's $_
function update_last_arg --on-event fish_postexec
    set -g __ (echo $argv | awk '{print $NF}')
end

function extract --description "Expand or extract bundled & compressed files"
    set --local ext (echo $argv[1] | awk -F. '{print $NF}')
    switch $ext
        case tar # non-compressed, just bundled
            tar -xvf $argv[1]
        case gz
            if test (echo $argv[1] | awk -F. '{print $(NF-1)}') = tar # tar bundle compressed with gzip
                tar -zxvf $argv[1]
            else # single gzip
                gunzip $argv[1]
            end
        case tgz # same as tar.gz
            tar -zxvf $argv[1]
        case bz2 # tar compressed with bzip2
            tar -jxvf $argv[1]
        case rar
            unrar x $argv[1]
        case zip
            unzip $argv[1]
        case 7z
            7za x $argv[1]
        case '*'
            echo "unknown extension"
    end
end

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
