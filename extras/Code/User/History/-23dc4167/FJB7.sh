#!/bin/bash

# # Define the path to the clipboard history file
# clipboard_file="$HOME/.clipboard_history.txt"

# # Create the clipboard history file if it doesn't exist
# touch "$clipboard_file"

# # Get the current clipboard content
# clipboard_content=$(xclip -selection clipboard -o)

# # Check if the clipboard content is not empty
# if [ -n "$clipboard_content" ]; then
#     # Add the clipboard content to the clipboard history file
#     echo "$clipboard_content" >> "$clipboard_file"
# fi

# # Use Wofi app selector to display the clipboard history
# wofi --show dmenu --lines 10 < "$clipboard_file"
wofi_style_path=~/.config/hypr/wofi/style.css

if [[ ! $(pidof wofi) ]]; then
	# cliphist list | wofi -dmenu -config ~/.config/hypr/wofi/style.css | cliphist decode | wl-copy
    cliphist list | wofi --style=$wofi_style_path --dmenu
else
	pkill wofi
fi

# Set the path to your wofi style

# Use cliphist to get clipboard history and pipe it to wofi for selection
# cliphist | wofi --style=$wofi_style_path --dmenu
