function update_last_arg --on-event fish_postexec --description 'use $__ to "sorta" mimic bash\'s $_'
    echo $argv
    set -g __ (echo $argv | awk '{print $NF}')
end
