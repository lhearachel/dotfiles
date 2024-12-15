function _prompt_context_err --argument-names with_exit_code
    if test -n "$with_exit_code" -a "$with_exit_code" -ne 0
        echo (set_color red)"[$with_exit_code]"
    end
end
