#!/usr/bin/env bash

WALL_DIR="$HOME/Pictures/wallpapers"                  
set_wallpaper() {
    local IMG="$1"

    
    [[ ! -f "$IMG" ]] && echo "Wallpaper Change Error" "File not found: $IMG" && notify-send "Wallpaper Error" "File not found: $IMG" && exit 1

    swww img "$IMG" \
        --transition-type wipe \
        --transition-pos 0.5,0.5 \
        --transition-step 90 \
        --transition-fps 60

    matugen image "$IMG" -t scheme-fruit-salad # good types -> scheme-fruit-salad, scheme-tonal-spot


    notify-send --icon "$IMG" " Wallpaper Changed 🎨" "Applied: $(basename "$IMG")"
    #======================================

    #=======================================
    # ./convert-gif.sh $IMG make errors read your current folder not script folder 
    $(dirname "$0")/hyprlock-wallpaper-setter $IMG
}

choose_menu() {
    CHOICE=$(echo -e "Random\n$(ls -1v "$WALL_DIR")" | rofi -dmenu -p "󰋫 Wallpaper" -i -lines 15 -width 40)

    [[ -z "$CHOICE" ]] && exit 0

    if [[ "$CHOICE" == "Random" ]]; then
        FILE=$(find -L "$WALL_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" -o -iname "*.gif" \) | shuf -n1)
    else
        FILE="$WALL_DIR/$CHOICE"
    fi

    set_wallpaper "$FILE"
}

case "$#" in
    0) choose_menu ;;
    1) set_wallpaper "$1" ;;
    *) echo "Usage: $0 [optional: image_path]" && exit 1 ;;
esac

