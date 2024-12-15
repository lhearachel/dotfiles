set --global FAILURE 1

function _prompt_context \
    --description "Print contextual prompt information" \
    --argument-names with_exit_code

    set --local prompt_ssh (_prompt_context_ssh)
    set --local prompt_cwd (_prompt_context_cwd)
    set --local prompt_git (_prompt_context_git)
    set --local prompt_err (_prompt_context_err $with_exit_code)

    set --local prompt
    for elem in $prompt_ssh $prompt_cwd $prompt_git $prompt_err
        if test (string length $elem) -gt 0
            set --append prompt "$elem"
        end
    end

    echo (string trim -l $prompt)
end
