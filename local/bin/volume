#!/bin/bash
set -e # Stop execution if any command fails

if [ -z "$1" ]; then
  echo -e "Error: ID and VOL[%][-/+] are required\n"
  wpctl set-volume --help
  exit 1
fi

# Change the volume
wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ "$1"

# Show the updated volume
NOTIFY_APP_NAME="progress-bar"
UPDATED_VOLUME=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2 * 100}')

notify-send \
  -a $NOTIFY_APP_NAME \
  -h string:x-canonical-private-synchronous:$NOTIFY_APP_NAME \
  -h int:value:$UPDATED_VOLUME "󰖀 "
