#!/bin/bash
swayidle -w \
timeout 1200 'notify-send "Idle for 20 minutes... locking" && sleep 5 && swaylock'
# timeout 400 'notify-send "Idle for 400 seconds... putting display to sleep" && sleep 5 && hyprctl dispatch dpms off' \
# timeout 900 'systemctl suspend' 
# resume 'hyprctl dispatch dpms on' 
# before-sleep 'swaylock'
