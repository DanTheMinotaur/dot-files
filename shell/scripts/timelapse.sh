#!/bin/bash

input=$1
output=$2
time=$3

original_duration=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 $input)
speed_factor=$(bc -l <<< "scale=4; $original_duration / $time")
setpts_factor=$(bc -l <<< "scale=4; 1 / $speed_factor")
ffmpeg -i $input -vf "setpts=$setpts_factor*PTS" -r 30 -t $time -c:v libx265 $output
