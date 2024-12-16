function _prompt_context_git --description "Print git repository information"
    set ABORT_FEATURE 2

    if not type -q --no-functions git # If git is not available, skip
        return $ABORT_FEATURE
    end

    set --local is_git_repository (command git rev-parse --is-inside-work-tree 2>/dev/null)

    if test -n "$is_git_repository"
        set --local git_prefix (set_color brmagenta)""
        set --local git_branch (_prompt_context_git_branch)
        set --local git_dirty (_prompt_context_git_dirty)
        set --local git_stash (_prompt_context_git_stash)
        set --local git_prompt "$git_branch$git_dirty$git_stash"

        set --local git_pending (_prompt_context_git_pending)
        if test -n $git_pending
            set --append git_prompt $git_pending
        end

        echo "$git_prefix $git_prompt"
    end
end
