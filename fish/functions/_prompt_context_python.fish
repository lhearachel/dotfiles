function _prompt_context_python
    set ABORT_FEATURE 2

    if not type -q --no-functions pyenv # If pyenv is not available, skip
        return $ABORT_FEATURE
    end

    if test -e "$PWD/.venv";
        or test -e "$PWD/pyproject.toml"
        set --local python_prefix (set_color bryellow)"󰌠"
        set --local python_version (set_color brblack)(pyenv version | cut -d ' ' -f 1)

        echo "$python_prefix $python_version"
    end
end
