#!/bin/bash
while true; do
  bat_lvl=$(cat /sys/class/power_supply/BAT0/capacity)
  if [ "$bat_lvl" -le 15 ]; then
    notify-send "Battery Low" "Level: ${bat_lvl}%" \
      --urgency=CRITICAL \
      --icon="$HOME/.config/scripts/assets/low-charge-battery.png"
    sleep 1200
  else
    sleep 120
  fi
done
