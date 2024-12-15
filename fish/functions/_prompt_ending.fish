function _prompt_ending
    set --local username (id -u -n)
    set --local prompt_char (set_color cyan)">"
    if test username = root
        set prompt_char (set_color yellow)"#"
    end

    echo -e -n $prompt_char
    echo -e (set_color normal)" "
end
