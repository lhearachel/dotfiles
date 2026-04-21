# License file for building pokeplatinum
set -gx LM_LICENSE_FILE "$GIT_REPOS/pokeplatinum/tools/cw/license.dat"

# Environment variables used by hledger
set -gx LEDGER_FILE ~/finance/journals/2025/2025.journal

set -gx MOZ_ENABLE_WAYLAND 1

mise activate --shims fish | source
