#!/bin/bash

BASE="$HOME/Pictures/wallpapers"

DIR=$(find "$BASE" -mindepth 1 -maxdepth 1 -type d \
  -printf "%f\n" | rofi -dmenu -p "Select category")

[ -z "$DIR" ] && exit

IMG=$(find "$BASE/$DIR" -type f \
  | sed "s|.*/||" \
  | rofi -dmenu -p "Select wallpaper")

[ -z "$IMG" ] && exit

swww img "$BASE/$DIR/$IMG" \
  --transition-type any \
  --transition-duration 1
