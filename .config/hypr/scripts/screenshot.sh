#!/bin/bash

OUTPUT="$HOME/Pictures/Screenshots"
FILENAME="$(date +'%Y-%m-%d_%H-%M-%S').png"
FILEPATH="$OUTPUT/$FILENAME"

mkdir -p "$OUTPUT"

if grim "$FILEPATH"; then
	wl-copy < "$FILEPATH"
	notify-send "Screenshot taken!" "Saved as $FILENAME"
	swappy -f "$FILEPATH"
else
	notify-send "Screenshot failed!" "Please check grim installation." --urgency=critical
fi
