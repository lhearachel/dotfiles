function _prompt_context_java
    set ABORT_FEATURE 2

    if not type -q --no-functions jenv # If jenv is not available, skip
        return $ABORT_FEATURE
    end

    if test -e "$PWD/Jarfile";
        or test -e "$PWD/.java-version"
        set --local java_prefix (set_color brred)"󰬷"
        set --local java_version (set_color brblack)(jenv version | cut -d ' ' -f 1)

        echo "$java_prefix $java_version"
    end
end
