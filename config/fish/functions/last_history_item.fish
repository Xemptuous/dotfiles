function last_history_item --description 'Mimics bash\'s !!'
    echo $history[1]
end
abbr -a !! --position anywhere --function last_history_item
