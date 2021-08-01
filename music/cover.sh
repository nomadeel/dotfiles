#!/bin/bash

for dir in Albums/*
do
    for file in "$dir"/*.flac
    do
        if [[ ! -f "$file" ]]
        then
            for file2 in "$dir"/*.mp3
            do
                ffmpeg -i "$file2" -y -vf scale=60:60 "${file2%/*}/cover.png" > /dev/null 2>&1
                echo "Extracting ${file2%/*}/cover.png"
                break 1
            done
            break 1
        fi
        ffmpeg -i "$file" -y -vf scale=60:60 "${file%/*}/cover.png" > /dev/null 2>&1
        echo "Extracting ${file%/*}/cover.png"
        break 1
    done
done
