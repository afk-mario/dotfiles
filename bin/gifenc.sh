#!/bin/sh
# http://blog.pkh.me/p/21-high-quality-gif-with-ffmpeg.html#usage

palette="/tmp/palette.png"
filters="fps=50,scale=iw*0.5:-1:flags=neighbor"

ffmpeg -v warning -i $1 -vf "$filters,palettegen=max_colors=4" -y $palette
ffmpeg -v warning -i $1 -i $palette -lavfi "$filters [x]; [x][1:v] paletteuse" -y $2
