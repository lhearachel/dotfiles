function fish_prompt
    set --local exit_code $status # Save the previous exit code.
    echo -e (_prompt_context $exit_code)"\n"(_prompt_ending)
end
