function _prompt_context_ruby
    set ABORT_FEATURE 2

    if not type -q --no-functions rbenv # If rbenv is not available, skip
        return $ABORT_FEATURE
    end

    if test -e "$PWD/Gemfile"
        set --local ruby_prefix (set_color brred)"󰴭"
        set --local ruby_version (set_color brblack)"v"(ruby --version | cut -d ' ' -f 2)

        echo "$ruby_prefix $ruby_version"
    end
end
