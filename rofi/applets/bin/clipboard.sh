#!/usr/bin/env bash

# Import Theme
source "$HOME"/.config/rofi/applets/shared/theme.bash
theme="$type/$style"

# Theme config
prompt='Clipboard'
mesg="Cliphist Manager"

if [[ ( "$theme" == *'type-1'* ) || ( "$theme" == *'type-3'* ) || ( "$theme" == *'type-5'* ) ]]; then
	list_col='1'
	list_row='8'
else
	list_col='1'
	list_row='8'
fi

efonts="JetBrains Mono Nerd Font 12"

# Rofi CMD
rofi_cmd() {
	rofi -theme-str "listview {columns: $list_col; lines: $list_row;}" \
		-theme-str 'textbox-prompt-colon {str: "";}' \
		-theme-str "element-text {font: \"$efonts\";}" \
		-dmenu \
    -i \
		-p "$prompt" \
		-mesg "$mesg" \
		-markup-rows \
		-theme ${theme}
}

# Run clipboard menu
run_rofi() {
	cliphist list | rofi_cmd
}

# Execute
chosen="$(run_rofi)"

if [[ -n "$chosen" ]]; then
	echo "$chosen" | cliphist decode | wl-copy
fi
