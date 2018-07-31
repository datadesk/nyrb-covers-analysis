#!/bin/sh
echo "Creating palettes"

echo "Deleting existing histogram data"
rm -rf ./palettes.txt

echo "Creating color palettes"
for filepath in `pwd`/quantized/*; do
	FILENAME="$(echo "$filepath" | rev | cut -d "/" -f1 | rev)"
	TITLE="$(echo $FILENAME | sed -r 's/(\.gif)//g')"
	echo "Making a histogram for $TITLE"
	echo $TITLE >> `pwd`/palettes.txt
	# need to run imagemagick a couple of times to get the right histogram... 
	convert $filepath -format %c histogram:info:$TITLE.txt 
	convert $filepath -format %c histogram:info:$TITLE.txt | sort -n $TITLE.txt | tail -1 | sed -e 's/.*\(#[0-9A-F]\+\).*/\1/'
	convert $filepath -format %c histogram:info:$TITLE.txt | sort -n $TITLE.txt | tail -1 | sed -e 's/.*\(#[0-9A-F]\+\).*/\1/'
	convert $filepath -format %c histogram:info:$TITLE.txt | sort -n $TITLE.txt | tail -1 | sed -e 's/.*\(#[0-9A-F]\+\).*/\1/'
	convert $filepath -format %c histogram:info:$TITLE.txt | sort -n $TITLE.txt | tail -1 | sed -e 's/.*\(#[0-9A-F]\+\).*/\1/'
	convert $filepath -format %c histogram:info:$TITLE.txt | sort -n $TITLE.txt | tail -5 | sed -e 's/.*\(#[0-9A-F]\+\).*/\1/' >> `pwd`/palettes.txt
done
