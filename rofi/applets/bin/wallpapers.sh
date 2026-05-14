#!/usr/bin/env bash

# Import Theme
source "$HOME"/.config/rofi/applets/shared/theme.bash
theme="$type/$style"

# Config
WALL_DIR="$HOME/Pictures/wallpapers"

prompt='Wallpaper'
mesg="Select category"

list_col='1'
list_row='8'

# Rofi CMD
rofi_cmd() {
	rofi -theme-str "listview {columns: $list_col; lines: $list_row;}" \
		-theme-str 'textbox-prompt-colon {str: "";}' \
		-dmenu \
		-p "$prompt" \
		-mesg "$mesg" \
		-theme ${theme}
}

# STEP 1: pilih folder
get_folders() {
	find "$WALL_DIR" -mindepth 1 -maxdepth 1 -type d -printf "%f\n"
}

selected_folder="$(get_folders | rofi_cmd)"

# kalau cancel → exit
[[ -z "$selected_folder" ]] && exit

# STEP 2: pilih wallpaper dalam folder
prompt='Select Wallpaper'
mesg="Folder: $selected_folder"

get_wallpapers() {
	find "$WALL_DIR/$selected_folder" -type f \( \
		-iname "*.jpg" -o \
		-iname "*.jpeg" -o \
		-iname "*.png" -o \
		-iname "*.webp" \) -printf "%f\n"
}

selected_wall="$(get_wallpapers | rofi_cmd)"

# kalau cancel → exit
[[ -z "$selected_wall" ]] && exit

# Full path
full_path="$WALL_DIR/$selected_folder/$selected_wall"

# Set wallpaper
swaybg -i "$full_path"
