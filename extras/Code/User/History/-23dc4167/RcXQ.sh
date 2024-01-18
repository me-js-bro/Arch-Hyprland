#!/bin/bash

# Define the path to the clipboard history file
clipboard_file="$HOME/.clipboard_history.txt"

# Create the clipboard history file if it doesn't exist
touch "$clipboard_file"

# Get the current clipboard content
clipboard_content=$(xclip -selection clipboard -o)

# Check if the clipboard content is not empty
if [ -n "$clipboard_content" ]; then
    # Add the clipboard content to the clipboard history file
    echo "$clipboard_content" >> "$clipboard_file"
fi

# Use Wofi app selector to display the clipboard history
wofi --show dmenu --lines 10 < "$clipboard_file"