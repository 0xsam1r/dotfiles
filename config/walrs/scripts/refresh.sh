#!/bin/env bash
pywalfox update
hyprctl reload

pkill -SIGUSR2 waybar
eww open clock
eww reload
cp ~/.cache/wal/mako-colors ~/.config/mako/config
makoctl reload
