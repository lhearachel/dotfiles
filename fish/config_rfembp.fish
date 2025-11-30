# Some Mac-specific overrides and path additions
fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/sbin
fish_add_path /opt/homebrew/opt/bison/bin
set -gx BROWSER "open -a firefox"
set -gx CLIP_COPY pbcopy

# This Macbook maintains siloing of Git repositories by GitHub user.
set -gx GIT_REPOS "$CODE_REPOS/github.com"
set -gx MY_GIT_REPOS "$CODE_REPOS/github.com"
set -gx DEX "$MY_GIT_REPOS/dex"

# My upstream username is different from my local user.
set -gx CHEF_USER rforshee
set -gx ST_USER rforshee

senv gitlab_pat
senv github_pat
senv vault.infra

# Necessary to set the SDK path for C++ programs for base g++/clang++
set -gx SDKROOT (xcrun --show-sdk-path)

# The next line updates PATH for the Google Cloud SDK.
if [ -f '~/google-cloud-sdk/path.fish.inc' ]
    source '~/google-cloud-sdk/path.fish.inc'
end

# ASDF configuration code
if test -z "$ASDF_DATA_DIR"
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end

# Do not use fish_add_path (added in Fish 3.2) because it
# potentially changes the order of items in PATH
if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims

# Enable Homebrew's internal JSON API
set -gx HOMEBREW_USE_INTERNAL_API 1
