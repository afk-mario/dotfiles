#!/bin/sh
# http://blog.pkh.me/p/21-high-quality-gif-with-ffmpeg.html#usage

palette="/tmp/palette.png"
filters="fps=50,scale=iw*0.5:-1:flags=neighbor"

input="$1"
output="${2:-${input%.*}.gif}"

ffmpeg -v warning -i "$input" \
  -vf "$filters,palettegen=max_colors=4" \
  -frames:v 1 -update 1 -y "$palette"

ffmpeg -v warning -i "$input" -i "$palette" \
  -filter_complex "$filters[x];[x][1:v]paletteuse" \
  -y "$output"
