#!/bin/sh
echo "Resizing images"

rm `pwd`/data/standardized-covers/*

for cover in `pwd`/data/raw-covers/*; do
	FILENAME="$(echo "$cover" | rev | cut -d "/" -f1 | rev)"
	TITLE="$(echo $FILENAME | sed -r 's/(\.jpg|\.png)//g')"
	echo "Resizing $TITLE"
	convert $cover -resize 270x432\! `pwd`/data/standardized-covers/$TITLE.gif
done
