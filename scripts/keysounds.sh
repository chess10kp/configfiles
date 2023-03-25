#!/bin/bash

# Path to the sound file
SOUND_FILE=/home/nitin/Downloads/Keyboard-Button-Click-07-c-FesliyanStudios.com.mp3

# Check if the sound file exists
if [ ! -f $SOUND_FILE ]; then
    echo "Error: Sound file not found"
    exit 1
fi

# Loop that reads key presses and plays sound
while read -rsn1 key; do
    nvlc  $SOUND_FILE &
done

