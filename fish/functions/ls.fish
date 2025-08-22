function ls --wraps=eza --wraps='eza --icons=auto --sort=type' --description 'alias ls=eza --icons=auto --sort=type'
    eza --icons=auto --sort=type $argv
end
