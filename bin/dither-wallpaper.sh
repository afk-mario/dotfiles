#!/usr/bin/env bash
# https://codeberg.org/ljc/scripts/src/branch/main/bin/dither-wallpaper
# dither-wallpaper
# MIT License, (c) 2022 Liam Cooke
#-------------------------------------------------------------------------------
#
# Apply a 16-color dither effect to a folder of wallpaper images.
#
# Instructions:
#
#  1. Save this script somewhere and make it executable:
#     `chmod +x dither-wallpaper`
#  2. Create a directory named 'input' and drop some images into it.
#  3. Run this script from the parent directory.
#  4. Observe the results in the 'output' directory.
#
# Example directory structure:
#
#     dither-wallpaper
#     input/
#       hello.jpg
#     output/
#       hello.jpg~16c@4x.png
#
# Each image is resized and cropped to 720x450, then scaled up 400% to match
# a screen resolution of 2880x1800. You can change the size by setting the
# environment variable DITHER_SIZE to a value of the form WxH, where W and
# H are 1/4 of the desired width and height.
#
# For example, for a screen resolution of 1920x1080, run:
#
#     DITHER_SIZE=480x270 ./dither-wallpaper
#
# Override the number of colors with DITHER_COLORS (default 16, max 256).
# This can be a space-separated list, to generate multiple images with
# different palettes.
#
# For example, the following will generate one 4-color image and one 16-color
# image for each source image:
#
#     DITHER_COLORS='4 16' ./dither-wallpaper
#
#-------------------------------------------------------------------------------

set -euo pipefail

size=${DITHER_SIZE:-720x450}
input_dir=${DITHER_INPUT_DIR:-input}
output_dir=${DITHER_OUTPUT_DIR:-output}
all_colors=${DITHER_COLORS:-16}
scale=${DITHER_SCALE:-4}

if [ ! -d "$input_dir" ]; then
  echo >&2 "Could not find the '$input_dir' directory."
  exit 1
fi

mkdir -p "$output_dir"

cd "$input_dir"

for src in *.*; do
  for colors in $all_colors; do
    dst="../${output_dir}/${src}~${colors}c@${scale}x.png"
    if [ "$src" = '*.*' ]; then
      echo >&2 "No images found in the '$input_dir' directory."
      exit 1
    elif [ -e "$dst" ]; then
      echo "Skipping ${dst}"
    else
      echo "Writing ${dst}"
      tmpfile=.dither-wallpaper-tmp.png
      nice convert "$src" \
        -unsharp '0x5' -resize "${size}^" \
        -gravity 'center' -extent "$size" \
        -brightness-contrast '-2x5' \
        -ordered-dither 'o8x8,6' \
        -colors "$colors" -depth 4 \
        -filter 'point' -resize "${scale}00%" \
        -strip "PNG8:${tmpfile}"
      mv "$tmpfile" "$dst"
    fi
  done
done
echo 'Done'
