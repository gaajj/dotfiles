#!/bin/bash

WALLPAPER_DIR="$HOME/Pictures/Wallpapers"

while true; do
    WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

    # Kill the previous swaybg so it doesn't stack processes
    pkill swaybg

    # Set a new wallpaper
    swaybg -i "$WALLPAPER" --mode fill &

    # Wait 10 minutes (600 seconds)
    sleep 600
done

