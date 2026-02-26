# Some Mac-specific overrides and path additions
fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/sbin
fish_add_path /opt/homebrew/opt/bison/bin
set -gx BROWSER "open -a firefox"
set -gx HOMEBREW_USE_INTERNAL_API 1
set -gx HOMEBREW_NO_ENV_HINTS 1

set -gx GIT_REPOS "$CODE_REPOS"
set -gx MY_GIT_REPOS "$CODE_REPOS/personal"
set -gx DEX "$MY_GIT_REPOS/dex"

# My upstream username is different from my local user.
set -gx CHEF_USER rforshee
set -gx ST_USER rforshee

# Load some important access-tokens.
# TODO: Move this to a global direnv config.
senv gitlab_pat
senv github_pat
senv vault.infra

# Necessary to set the SDK path for C++ programs for base g++/clang++
set -gx SDKROOT (xcrun --show-sdk-path)

# The next line updates PATH for the Google Cloud SDK.
if [ -f '~/google-cloud-sdk/path.fish.inc' ]
    source '~/google-cloud-sdk/path.fish.inc'
end
