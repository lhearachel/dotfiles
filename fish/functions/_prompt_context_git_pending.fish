function _prompt_context_git_pending
    set --local git_unpushed
    set --local git_unpulled

    set --local has_upstream (command git rev-parse --abbrev-ref '@{upstream}' 2>/dev/null)

    if test -n "$has_upstream"; and test "$has_upstream" != '@{upstream}'
        command git rev-list --left-right --count 'HEAD...@{upstream}' | read --local --array git_status
        set --local to_push $git_status[1]
        set --local to_pull $git_status[2]

        if test "$to_push" -gt 0
            set git_unpushed (set_color cyan)""
        end

        if test "$to_pull" -gt 0
            set git_unpulled (set_color cyan)""
        end

        echo "$git_unpushed$git_unpulled"
    end
end
