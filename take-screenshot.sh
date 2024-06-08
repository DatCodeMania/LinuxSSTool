#!/bin/bash

filePath=~/Pictures/Screenshots/$(date +"%H:%M")_$(date +"%m-%d-%y").png
tempFilePath=~/Pictures/Screenshots/temp.png
gradientFilePath=~/Pictures/Screenshots/gradient.png

borderSize=5

gradientColor1=yellow
gradientColor2=red

command_exists() {
    command -v "$1" &> /dev/null
}

handle_not_installed() {
    echo "'$1' is not installed. Exiting..."
    exit 1
}

mkdir -p ~/Pictures/Screenshots &> /dev/null

if ! command_exists scrot; then
    handle_not_installed scrot
elif ! command_exists xclip; then
    handle_not_installed xclip
elif ! command_exists magick; then
    handle_not_installed ImageMagick
fi

# Take screenshot
scrot --select --line color=#FFFFFF --display :0 --quality 100 --file $tempFilePath

# Get the dimensions of the screenshot
width=$(identify -format "%w" $tempFilePath)
height=$(identify -format "%h" $tempFilePath)

# Create a gradient image with the same size as the screenshot, with added border size
magick -size $((width + 2 * borderSize))x$((height + 2 * borderSize)) gradient:$gradientColor1-$gradientColor2 $gradientFilePath

# Add a border around the screenshot by overlaying gradient image
magick $tempFilePath -bordercolor none -border $borderSize $gradientFilePath -compose DstOver -composite $filePath

# Copy file to clipboard
/usr/bin/cat $filePath | xclip -selection clipboard -target image/png -i

# Send notification
notify-send "Saved screenshot to $filePath. File copied to clipboard."

# Clean up temporary files
rm $tempFilePath $gradientFilePath
