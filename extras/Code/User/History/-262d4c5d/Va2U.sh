#!/bin/bash

# delete clipboard history...
if [[ ! $(pidof rofi) ]]; then
	cliphist wipe
else
	pkill rofi
fi
