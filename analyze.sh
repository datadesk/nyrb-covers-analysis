#!/bin/sh

rm `pwd`/data/analyzed-covers.csv
echo "slug,dominant_cover_color" >> `pwd`/data/analyzed-covers.csv

for filepath in `pwd`/data/quantized-covers/*; do
	FILENAME="$(echo "$filepath" | rev | cut -d "/" -f1 | rev)"
	TITLE="$(echo $FILENAME | sed -r 's/(\.gif)//g')"
	echo "Making detailed histogram for $TITLE"
    COLOR="$(convert $filepath -format %c histogram:info:- | sort -r --sort=numeric | head -1 |  sed -e 's/.*\(#[0-9A-F]\+\).*/\1/')"
	echo "$TITLE,$COLOR" >> `pwd`/data/analyzed-covers.csv
done