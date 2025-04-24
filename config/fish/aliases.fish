# eza
alias l="eza -1 --icons --color=always $argv"
alias ls="eza --icons --color=always $argv"
alias la="eza -a --icons --color=always $argv"
alias lc="eza -1 --icons=never --color=never $argv"
alias lca="eza -1a --icons=never --color=never $argv"
alias ld="eza -D --icons --color=always $argv"
alias ll="eza -l --icons --git --color=always --no-user --time-style long-iso $argv"
alias lla="eza -lam --icons --git --color=always --time-style long-iso $argv"
alias lS="eza -las size --icons --git --color=always --no-user --time-style long-iso --total-size $argv"
alias lSd="eza -lDas size --icons --git --color=always --no-user --time-style long-iso --total-size $argv"
alias l2="eza -TL 2 --icons --git --color=always --no-user --time-style long-iso $argv"
alias l3="eza -TL 3 --icons --git --color=always --no-user --time-style long-iso $argv"

alias pacman="sudo pacman"

# bat
alias cat="bat --style=plain --paging=never $argv"
alias bat="bat --style='header,grid' $argv"
alias less="bat --style='header,grid' $argv"

# alias fd="set -l LS_COLORS (vivid generate catppuccin-latte); $LS_COLORS fd $argv"
alias rgf="rg --files | rg $argv"

# fzf
alias fzf="fzf --height ~40% --layout reverse --border"
alias fnv="nvim \$(fzf --height ~40% --layout reverse --border)"
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

alias gs="git status --short"
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
alias draw="rnote"
alias paint="rnote"

alias shutdown="systemctl poweroff"
alias reboot="systemctl reboot"

function alm
    sshfs \
        -o auto_unmount \
        -o auto_cache \
        -F $HOME/.ssh/config \
        alm:/var/www/alm/analytics-and-reporting /mnt/alm/ &
end

function vm
    sudo systemctl start libvirtd.service && sudo virsh net-start default 2&>/dev/null
    nohup virt-manager 2&>/dev/null &
    # sudo systemctl start libvirtd.service && sudo virsh net-start default 2&>/dev/null
    # sudo virsh --connect qemu:///system start $argv[1]
end
