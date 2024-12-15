function ef --description="Edit fish configuration"
    pushd /fish >/dev/null
    v config.fish
    popd - >/dev/null
end
