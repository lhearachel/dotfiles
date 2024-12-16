set --global FAILURE 1

function _prompt_context \
    --description "Print contextual prompt information" \
    --argument-names with_exit_code

    set --local prompt_ssh (_prompt_context_ssh)
    set --local prompt_cwd (_prompt_context_cwd)
    set --local prompt_git (_prompt_context_git)
    set --local prompt_err (_prompt_context_err $with_exit_code)

    set --local prompt_python (_prompt_context_python)
    set --local prompt_node (_prompt_context_node)
    set --local prompt_ruby (_prompt_context_ruby)
    set --local prompt_java (_prompt_context_java)

    set --local prompt
    for elem in $prompt_ssh $prompt_cwd $prompt_ruby $prompt_python $prompt_node $prompt_java $prompt_git $prompt_err
        if test (string length $elem) -gt 0
            set --append prompt "$elem"
        end
    end

    echo (string trim -l $prompt)
end
