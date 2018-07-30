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
convert /home/aida/nyrb-colors-analysis/nyrb-colors-analysis/covers/when-the-world-spoke-french.jpg -dither Riemersma -colors 8 \
	colors_8_rm.gif | convert colors_8_rm.gif -format %c -depth 5 histogram:info:histogram_image.txt | sort \
	-n histogram_image.txt | sort -n histogram_image.txt | tail -5 


# to get into imagemagick
sudo -i
cd ImageMagick-7.0.8-8

# colors with lots of different shades of similar colors are tricky 	
# I think that these will require color quantization in order to reduce the number of different shades
# (work computer) file paths to tricky palettes:
/home/aida/nyrb-colors-analysis/nyrb-colors-analysis/covers/victorine.jpg
/home/aida/nyrb-colors-analysis/nyrb-colors-analysis/covers/the-peach-blossom-fan.jpg
# -colors 5 worked best with this cover ^ 

# pictures with lots of different colors and lots of different shading
/home/aida/nyrb-colors-analysis/nyrb-colors-analysis/covers/wish-her-safe-at-home.jpg
/home/aida/nyrb-colors-analysis/nyrb-colors-analysis/covers/when-the-world-spoke-french.jpg

# pictures with lots of different colors and not a lot of variation in shading 
/home/aida/nyrb-colors-analysis/nyrb-colors-analysis/covers/youll-enjoy-it-when-you-get-there.jpg
# pro-tip for this cover ^ quantize first!!!

# TEST BY COVER
# YOULL ENJOY IT WHEN YOU GET THERE
convert /home/aida/nyrb-colors-analysis/nyrb-colors-analysis/covers/youll-enjoy-it-when-you-get-there.jpg -format %c -depth 5 histogram:info:histogram_image.txt | sort -n histogram_image.txt | tail -5
convert /home/aida/nyrb-colors-analysis/nyrb-colors-analysis/covers/youll-enjoy-it-when-you-get-there.jpg -dither Riemersma -colors 8 \
	colors_8_rm.gif | convert colors_8_rm.gif -format %c -depth 5 histogram:info:histogram_image.txt | sort \
	-n histogram_image.txt | sort -n histogram_image.txt | tail -5 
convert /home/aida/nyrb-colors-analysis/nyrb-colors-analysis/covers/youll-enjoy-it-when-you-get-there.jpg -dither Riemersma -colors 5 colors_8_rm.gif | display colors_8_rm.gif