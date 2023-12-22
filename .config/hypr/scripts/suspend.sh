#!/bin/bash
swayidle -w \
timeout 120 'notify-send "Idle for 2 minutes... locking" && sleep 5 && swaylock' \
timeout 400 'hyprctl dispatch dpms off' \
timeout 6000 'systemctl suspend' \
resume 'hyprctl dispatch dpms on' \
before-sleep 'swaylock'
