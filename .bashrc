# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

###############################################################################
#                             SHELL CONFIGURATION                             #
###############################################################################

shopt -s checkwinsize
shopt -s globstar

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

###############################################################################
#                            ENVIRONMENT VARIABLES                            #
###############################################################################

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export BROWSER="firefox"
. "$HOME/.cargo/env"

export CODE="$HOME/code"
export GITUSER="lhearachel"
export GHREPOS="$CODE/github.com"
export MYREPOS="$GHREPOS/$GITUSER"
export DOTFILES="$MYREPOS/dotfiles"
export SCRIPTS="$DOTFILES/scripts"

export VISUAL=nvim
export EDITOR=nvim

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

###############################################################################
#                             PATH CONFIGURATION                              #
###############################################################################

# from Arch Wiki; prevents adding directories multiple times
add_path() {
	[ "$(id -u)" -ge 1000 ] || return

	for i in "$@"; do
		# check if directory exists
		[ -d "$i" ] || continue

		# check that directory is not already in the path
		echo "$PATH" | grep -Eq "(^|:)$i(:|$)" && continue

		# all good, append
		export PATH="${PATH}:$i"
	done
}

add_path "$HOME"/.local/bin "$DOTFILES/scripts"

###############################################################################
#                            HISTORY CONFIGURATION                            #
###############################################################################

export HISTFILE=~/.histfile
export HISTSIZE=25000
export SAVEHIST=25000
export HISTCONTROL=ignorespace

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
	local userd="$GHREPOS/$user" # TODO: clones from non-github sources
	local path="$userd/$name"
	[[ -d "$path" ]] && cd "$path" && return # already checked out, bail


	# do the clone
	mkdir -p "$userd"
	cd "$userd"
	local cmd="git clone $1 $path"
	echo $cmd
	eval $cmd
} && export -f clone

###############################################################################
#                              SSH CONFIGURATION                              #
###############################################################################

if ! pgrep -u "$USER" ssh-agent >/dev/null; then
	ssh-agent >"$XDG_RUNTIME_DIR/ssh-agent.env"
fi

if [[ ! "$SSH_AUTH_SOCK" ]]; then
	source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi

if [[ $(grep -E "^(ID|NAME)=" /etc/os-release | grep -q "ubuntu")$? == 0 ]]; then
	eval "$(ssh-agent -s)" >/dev/null
fi

ssh-add -q ~/.ssh/id_ed25519

###############################################################################
#                                   ALIASES                                   #
###############################################################################

alias v=nvim
alias g=git
alias t=tmux
alias x=exit
alias gr='grep --color=auto'
alias sk='killall ssh-agent && source ~/.bashrc'
alias sv=sudoedit
alias sapt='sudo apt'

# cd
alias ..='cd ..'
alias code='cd $CODE'
alias dot='cd $DOTFILES'

# core utils
alias ls='exa'
alias ll='exa -la'
alias cat='bat'
alias du='dust'

# git
alias gst='git status'
alias gpush='git stash push'
alias gpop='git stash pop'
alias gup='git pull --rebase'
alias grbi='git rebase --interactive'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'

# edit config files
alias eb='v ~/.bashrc'
alias ev='cd $XDG_CONFIG_HOME/nvim && v init.lua && cd -'
alias sb='source ~/.bashrc'

# sort all files by last modification (ignores hiddens)
alias last='find . -type f -not -path "*/\.*" -exec ls -lrt {} +'

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

