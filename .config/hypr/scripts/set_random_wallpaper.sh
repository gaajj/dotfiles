#!/bin/bash

WALLPAPER_DIR="$HOME/Pictures/Wallpapers"
WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

# Kill any running swaybg instance first
pkill swaybg

# Set the random wallpaper
swaybg -i "$WALLPAPER" --mode fill
