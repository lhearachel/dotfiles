set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_DATA_HOME "$HOME/.local/share"
set -gx XDG_STATE_HOME "$HOME/.local/state"
set -gx XDG_BIN_HOME "$HOME/.local/bin"

set -gx BROWSER firefox
set -gx VISUAL nvim
set -gx EDITOR nvim

# Use bat as the pager for man
# https://github.com/sharkdp/bat#man
set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -gx MANROFFOPT -c

set -gx DOTFILES "$HOME/dotfiles"
set -gx PYENV_ROOT "$HOME/.pyenv"
set -gx CARGO_ROOT "$HOME/.cargo"

set -gx CODE_REPOS "$HOME/code"
set -gx GIT_REPOS "$CODE_REPOS/git"
set -gx DEX "$GIT_REPOS/dex"

set -gx CLIP_COPY wl-copy

fish_add_path "$XDG_BIN_HOME"
fish_add_path "$DOTFILES/scripts"
fish_add_path "$PYENV_ROOT/bin"
fish_add_path "$CARGO_ROOT/bin"

if test (uname -s) = Darwin
    fish_add_path /opt/homebrew/bin
    set -gx BROWSER "open -a firefox"
    set -gx CLIP_COPY pbcopy
end

set -gx fish_prompt_pwd_dir_length 0

if status is-interactive
    fish_config theme choose catppuccin
    type -q --no-functions pyenv; and pyenv init - | source
    type -q --no-functions rbenv; and rbenv init - | source
    type -q --no-functions jenv; and jenv init - | source
end
