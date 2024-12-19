function senv --description "Source an environment file" --argument-names env
    set --local env_dir "$XDG_DATA_HOME/env"
    set --local env_file "$env_dir/$env.fish"

    if not test -d "$env_dir"
        echo "$env_dir does not exist"
        exit 1
    end

    if not test -f "$env_file"
        echo "Environment file $env does not exist"
        exit 1
    end

    . $env_file
end
