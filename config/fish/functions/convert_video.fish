function convert_video
    set newname (string replace -r '\..*' '' $argv[1])
    ffmpeg -fflags +genpts -i "$argv[1]" -c:v copy -c:a copy "$newname.mkv"
end
