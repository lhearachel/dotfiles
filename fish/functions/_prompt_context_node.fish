function _prompt_context_node
    set ABORT_FEATURE 2

    if not type -q nvm # If nvm is not available, skip
        return $ABORT_FEATURE
    end

    if test -e "$PWD/.nvmrc";
        or test -e "$PWD/.node-version"
        set --local node_prefix (set_color brgreen)"󰎙"
        set --local node_version (set_color brblack)(nvm current)

        echo "$node_prefix $node_version"
    end
end
