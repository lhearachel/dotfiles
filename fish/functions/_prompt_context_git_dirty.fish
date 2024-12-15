function _prompt_context_git_dirty
    set --local dirty

    set --local is_dirty (
        if command git rev-list --max-count=1 HEAD -- >/dev/null 2>&1;
            not command git diff-index --ignore-submodules --cached --quiet HEAD -- >/dev/null 2>&1;
        else;
            not command git diff --staged --ignore-submodules --no-ext-diff --quiet --exit-code >/dev/null 2>&1;
        end
        or not command git diff --ignore-submodules --no-ext-diff --quiet --exit-code >/dev/null 2>&1
        or command git ls-files --others --exclude-standard --directory --no-empty-directory --error-unmatch -- ':/*' >/dev/null 2>&1
        and echo "true"
    )

    if test -n "$is_dirty"
        echo (set_color cyan)"*"
    end
end
