# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

###############################################################################
#                             SHELL CONFIGURATION                             #
###############################################################################

shopt -s checkwinsize
shopt -s globstar
shopt -s autocd
shopt -s checkwinsize

set -o vi

bind -x '"\C-l":clear'

if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

complete -c man which
complete -cf sudo

###############################################################################
#                            ENVIRONMENT VARIABLES                            #
###############################################################################

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_BIN_HOME="$HOME/.local/bin"

export XDGCFG="$XDG_CONFIG_HOME"
export XDGBIN="$XDG_BIN_HOME"

export BROWSER="firefox"
export VISUAL=nvim
export EDITOR=nvim

export CODE="$HOME/code"
export GITUSER="lhearachel"
export GHREPOS="$CODE/github.com"
export MYREPOS="$GHREPOS/$GITUSER"
export DOTFILES="$HOME/dotfiles"
export SCRIPTS="$DOTFILES/scripts"
export DEX="$MYREPOS/dex"

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

###############################################################################
#                             PATH CONFIGURATION                              #
###############################################################################

# from Arch Wiki; prevents adding directories multiple times
add_path() {
    # Mac specifies new user UIDs as starting at 500
    # Arch and Debian specify them as starting at 1000
    [ "$(id -u)" -ge 500 ] || return

    for i in "$@"; do
        # check if directory exists
        [ -d "$i" ] || continue

        # check that directory is not already in the path
        echo "$PATH" | grep -Eq "(^|:)$i(:|$)" && continue

        # all good, prepend
        export PATH="$i:${PATH}"
    done
}

add_path "/usr/lib" "$HOME"/.local/bin "$DOTFILES/scripts" "$XDG_BIN_HOME/neovim/bin"

###############################################################################
#                            HISTORY CONFIGURATION                            #
###############################################################################

export HISTFILE=~/.histfile
export HISTSIZE=25000
export SAVEHIST=25000
export HISTCONTROL="ignorespace:erasedups"

###############################################################################
#                              USEFUL FUNCTIONS                               #
###############################################################################

clone() {
    # extract repo user+name
    local repo="$1" user
    local repo="${repo#https://github.com/}"
    local repo="${repo#git@github.com:}"
    if [[ $repo =~ / ]]; then
        user="${repo%%/*}"
    else
        user="$GITUSER"
        [[ -z "$user" ]] && user="$USER"
    fi

    # determine where to clone the repo
    local name="${repo##*/}"
    local name="${name%*.git}"
    local userd="$GHREPOS/$user"
    local path="$userd/$name"
    [[ -d "$path" ]] && cd "$path" && return # already checked out, bail

    # do the clone
    mkdir -p "$userd"
    local cmd="git clone $1 $path"
    eval "$cmd"
    cd "$path"
} && export -f clone

###############################################################################
#                              SSH CONFIGURATION                              #
###############################################################################

if ! ps -p $SSH_AGENT_PID &>/dev/null; then
    eval `ssh-agent -s` &>/dev/null
fi

ssh-add -q ~/.ssh/id_ed25519 &>/dev/null

###############################################################################
#                                HELPFUL STUFF                                #
###############################################################################

# Search through history with Up/Down arrow keys
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-backward'

run-help() {
    help "$READLINE_LINE" 2>/dev/null || man "$READLINE_LINE";
}

# Press Alt+h to bring up the manpage for a command preceding the cursor
bind -m vi-insert -x '"\eh": run-help'
bind -m emacs -x '"\eh": run-help'

###############################################################################
#                                   ALIASES                                   #
###############################################################################

alias v=nvim
alias g=git
alias t=tmux
alias x=exit
alias spot=ncspot
alias gr='grep --color=auto'
alias sk='killall ssh-agent && source ~/.bashrc'
alias sv=sudoedit
alias sapt='sudo apt'
alias spac='sudo pacman'

# cd
alias code='cd $CODE'
alias dot='cd $DOTFILES'
alias xdgcfg='cd $XDG_CONFIG_HOME'
alias dex='cd $DEX'

# core utils
alias ls='exa'
alias la='exa -a'
alias ll='exa -la'
alias cat='bat'
alias du='dust'

# git
alias ga='g add'
alias grm='g rm'
alias gst='g status'

alias gc='g commit'
alias gc!='g commit --amend'
alias gcmsg='g commit --message'

alias gco='g checkout'
alias gcob='g checkout --branch'
alias gb='g branch'

alias gpush='g stash push'
alias gpop='g stash pop'

alias gp='g push'
alias gup='g pull --rebase'

alias grbi='g rebase --interactive'
alias grba='g rebase --abort'
alias grbc='g rebase --continue'

# edit config files
alias eb='v ~/.bashrc'
alias ea='v $XDG_CONFIG_HOME/alacritty/alacritty.toml'
alias ev='cd $XDG_CONFIG_HOME/nvim && v init.lua && cd -'
alias sb='source ~/.bashrc'
alias eq='v $XDG_CONFIG_HOME/qtile/config.py'
alias eh='v $XDG_CONFIG_HOME/hypr/hyprland.conf'
alias ep='v $XDG_CONFIG_HOME/starship.toml'

eval "$(starship init bash)"

