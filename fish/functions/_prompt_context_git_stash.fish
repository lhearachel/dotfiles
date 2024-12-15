function _prompt_context_git_stash
    set --local stash
    set --local has_stash (
        command git rev-list --walk-reflogs --count refs/stash >/dev/null 2>&1
        and echo "true"
    )

    if test -n "$has_stash"
        set stash (set_color cyan)" 󰍜"
    end
end
