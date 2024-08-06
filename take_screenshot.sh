#!/bin/bash

# Check if maim and xclip are installed
if ! command -v maim &> /dev/null; then
    echo "maim not found. Please install it."
    exit 1
fi

if ! command -v xclip &> /dev/null; then
    echo "xclip not found. Please install it."
    exit 1
fi

# Set default directory
PIC_DIR="$HOME/Pictures"

# Ensure at least 1 argument is provided
if [ "$#" -lt 1 ]; then
    echo "Usage: $0 <area|screen> [filename]"
    echo "If filename is specified, the screenshot will be saved to that file."
    echo "If filename is not specified, the screenshot will be copied to the clipboard."
    exit 1
fi

# Read arguments
TYPE=$1
FILENAME=$2
FILEPATH="$PIC_DIR/$FILENAME"

# Handle screenshot modes
if [ -n "$FILENAME" ]; then
    # Save to file
    if [ "$TYPE" = "area" ]; then
        maim -s "$FILEPATH"
    elif [ "$TYPE" = "screen" ]; then
        maim "$FILEPATH"
    else
        echo "Invalid type. Use 'area' or 'screen'."
        exit 1
    fi
else
    # Copy to clipboard
    if [ "$TYPE" = "area" ]; then
        maim -s | xclip -selection clipboard -t image/png
    elif [ "$TYPE" = "screen" ]; then
        maim | xclip -selection clipboard -t image/png
    else
        echo "Invalid type. Use 'area' or 'screen'."
        exit 1
    fi
fi

