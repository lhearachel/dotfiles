set -g XDG_CONFIG_HOME "$HOME/.config"
set -g XDG_DATA_HOME "$HOME/.local/share"
set -g XDG_STATE_HOME "$HOME/.local/state"
set -g XDG_BIN_HOME "$HOME/.local/bin"

set -g BROWSER firefox
set -g VISUAL nvim
set -g EDITOR nvim

if status is-interactive
    fish_config theme choose catppuccin
end
