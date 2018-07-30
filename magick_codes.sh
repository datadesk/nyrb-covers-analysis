# color quantization
 convert logo.png  -dither Riemersma   -colors 8  colors_8_rm.gif
 convert logo.png  -dither FloydSteinberg \
                                        -colors 8  colors_8_fs.gif
convert logo.png  +dither             -colors 8  colors_8_no.gif

# display image
display colors_8_rm.gif

# histogram of five colors
convert /home/aida/nyrb-colors-analysis/nyrb-colors-analysis/covers/when-the-world-spoke-french.jpg -format %c -depth 5 histogram:info:histogram_image.txt | sort -n histogram_image.txt | tail -5

# 1) color quantization 2) display image
convert /home/aida/nyrb-colors-analysis/nyrb-colors-analysis/covers/when-the-world-spoke-french.jpg -dither Riemersma -colors 5 colors_8_rm.gif | display colors_8_rm.gif

# 1) color quantization 2) histogram of five colors
convert /home/aida/nyrb-colors-analysis/nyrb-colors-analysis/covers/when-the-world-spoke-french.jpg -dither Riemersma -colors 5 \
	colors_8_rm.gif | convert colors_8_rm.gif -format %c -depth 5 histogram:info:histogram_image.txt | sort \
	-n histogram_image.txt | sort -n histogram_image.txt | tail -5 