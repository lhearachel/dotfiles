function em --wraps='pushd /home/rachel/.config/mise > /dev/null; v mise.toml:q; popd - > /dev/null' --wraps='pushd /home/rachel/.config/mise > /dev/null; v config.toml; popd - > /dev/null' --description 'alias em=pushd /home/rachel/.config/mise > /dev/null; v config.toml; popd - > /dev/null'
  pushd /home/rachel/.config/mise > /dev/null; v config.toml; popd - > /dev/null $argv
        
end
