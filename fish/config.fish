set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_DATA_HOME "$HOME/.local/share"
set -gx XDG_STATE_HOME "$HOME/.local/state"
set -gx XDG_BIN_HOME "$HOME/.local/bin"

set -gx BROWSER firefox
set -gx VISUAL nvim
set -gx EDITOR nvim
set -gx HOSTNAME (uname -n)

set -gx MANPAGER "less -sR"

set -gx DOTFILES "$HOME/dotfiles"
set -gx PYENV_ROOT "$HOME/.pyenv"
set -gx CARGO_ROOT "$HOME/.cargo"

set -gx CODE_REPOS "$HOME/code"
set -gx GIT_REPOS "$CODE_REPOS/git"
set -gx DEX "$GIT_REPOS/dex"

fish_add_path "$XDG_BIN_HOME"
fish_add_path "$DOTFILES/scripts"
fish_add_path "$CARGO_ROOT/bin"

set --local machine_config ~/.config/fish/config_(prompt_hostname).fish
if test -e $machine_config
    source $machine_config
else
    echo (set color bryellow)"⚠  No local config found for machine "(prompt_hostname)(set color normal)
end

set -gx fish_prompt_pwd_dir_length 0

if status is-interactive
    fish_config theme choose catppuccin
end

function _space_prompts --on-event fish_postexec
    echo
end

fish_config theme choose catppuccin
