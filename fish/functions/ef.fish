function ef --description="Edit fish configuration"
    pushd $__fish_config_dir >/dev/null
    v config.fish
    popd - >/dev/null
end
