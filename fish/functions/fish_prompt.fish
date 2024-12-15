function fish_prompt
    set --local exit_code $status # Save the previous exit code.

    echo -e (_prompt_context)
    echo -e (_prompt_ending)
end
