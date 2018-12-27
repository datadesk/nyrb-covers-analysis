#!/bin/sh
echo 'Processing images'

rm `pwd`/data/quantized-covers/*

echo "Quantizing covers"
for filepath in `pwd`/data/standardized-covers/*; do
    INPUT="$(echo "$filepath" | rev | cut -d "/" -f1 | rev)"
    echo "Converting $INPUT to quantized GIF"
    convert $filepath -dither Riemersma -colors 8 ./data/quantized-covers/$INPUT
done