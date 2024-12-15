function _prompt_context_ssh
    if test "$SSH_CONNECTION" != ""
        set --local username (id -u -n)
        set --local at_sign "@"
        set --local color (set_color blue)

        echo "$color$username$at_sign$hostname"
    end
end
