#!/bin/bash

BODY_FONT="Hurmit Nerd Font Mono 13"
DIMMED_COLOR="#26635D"

# Get the current battery percentage
battery_percentage=$(cat /sys/class/power_supply/BAT0/capacity)
# battery_percentage=15

# Get the battery status (Charging or Discharging)
# battery_status=$(cat /sys/class/power_supply/BAT0/status)

# Blocks
total_blocks=15
filled_blocks=$((battery_percentage * total_blocks / 100))

# Build bar
highlighted_bar=""
dimmed_bar=""
for ((i = 1; i <= total_blocks; i++)); do
  if [ "$i" -le "$filled_blocks" ]; then
    highlighted_bar+="▌"
  else
    dimmed_bar+="▌"
  fi
done

# Output the battery percentage and icon
echo "0$battery_percentage  <span font='$BODY_FONT' rise='8000'>$highlighted_bar<span color='$DIMMED_COLOR'>$dimmed_bar</span></span>"
