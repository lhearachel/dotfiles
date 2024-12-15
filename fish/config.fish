set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_DATA_HOME "$HOME/.local/share"
set -gx XDG_STATE_HOME "$HOME/.local/state"
set -gx XDG_BIN_HOME "$HOME/.local/bin"

set -gx BROWSER firefox
set -gx VISUAL nvim
set -gx EDITOR nvim

set -gx DOTFILES "$HOME/dotfiles"
set -gx PYENV_ROOT "$HOME/.pyenv"
set -gx CARGO_ROOT "$HOME/.cargo"

fish_add_path "$XDG_BIN_HOME"
fish_add_path "$DOTFILES/scripts"
fish_add_path "$PYENV_ROOT/bin"
fish_add_path "$CARGO_ROOT/bin"

set fish_prompt_pwd_dir_length 0

if status is-interactive
    fish_config theme choose catppuccin
    pyenv init - | source
end
