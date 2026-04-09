#!/bin/bash
set -e # Stop execution if any command fails

if [ -z "$1" ]; then
  echo "Error: [+]VAL[%] or VAL[%][-] are required"
  exit 1
fi

# Changing the brightness
brightnessctl -n s "$1"

# Show the updated brightness level
NOTIFY_APP_NAME="progress-bar"
BRIGHTNESS=$(brightnessctl g)
MAX=$(brightnessctl m)

if [ -z "$BRIGHTNESS" ] || [ -z "$MAX" ]; then
  notify-send "Error geting brightness" --urgency=critical
  exit 1
fi

BRIGHT_LEVEL=$(awk "BEGIN { printf \"%d\", ($BRIGHTNESS / $MAX) * 100 }")

notify-send \
  -a $NOTIFY_APP_NAME \
  -h string:x-canonical-private-synchronous:$NOTIFY_APP_NAME \
  -h int:value:$BRIGHT_LEVEL "󰖙 "
