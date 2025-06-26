#!/bin/bash
set -e # Stop execution if any command fails

# Toggle mute state of the default audio sink
wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle

# Show the current mute state
NOTIFY_APP_NAME="audio-mute"
CURRENT_STATUS=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $3}')
NOTIFY_VALUE="󱄠"

if [ "$CURRENT_STATUS" = "[MUTED]" ]; then
  NOTIFY_VALUE="󰖁"
fi

notify-send \
  -a $NOTIFY_APP_NAME \
  -h string:x-canonical-private-synchronous:"$NOTIFY_APP_NAME" \
  "$NOTIFY_VALUE" ""
