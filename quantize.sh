#!/bin/sh
echo 'Processing images'

echo "Deleting quantized folder"
rm -rf ./quantized

echo "Recreating quantized folder"
mkdir ./quantized

echo "Quantizing covers"
for filepath in `pwd`/covers/*; do
    INPUT="$(echo "$filepath" | rev | cut -d "/" -f1 | rev)"
    OUTPUT="$(echo $INPUT | sed -r 's/(jpg|png)/gif/g')"
    echo "Converting $INPUT to quantized GIF"
    convert $filepath -dither Riemersma -colors 5 ./quantized/$OUTPUT
done



