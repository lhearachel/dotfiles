function _prompt_context_git_branch
    set --local git_branch (
        command git symbolic-ref --short HEAD 2>/dev/null;
            or command git name-rev --name-only HEAD 2>/dev/null
    )

    echo (set_color brblack)"$git_branch"
end
