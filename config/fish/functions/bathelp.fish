function bathelp
    command bat --plain --language=help $argv
end
function help
    $argv --help 2>&1 | bathelp
end
