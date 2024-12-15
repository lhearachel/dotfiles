function ev --description="Edit nvim configuration"
    pushd $XDG_CONFIG_HOME/nvim >/dev/null
    v init.lua
    popd - >/dev/null
end
