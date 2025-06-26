#!/bin/bash
set -e # Stop execution if any command fails

# Toggle play/pause for media
playerctl play-pause

# Show the updated play/pause status
NOTIFY_APP_NAME="play-pause"
CURRENT_STATUS=$(sleep 0.1 && playerctl status)
NOTIFY_VALUE=""

if [ "$CURRENT_STATUS" = "Playing" ]; then
  NOTIFY_VALUE=""
fi

notify-send \
  -a $NOTIFY_APP_NAME \
  -h string:x-canonical-private-synchronous:$NOTIFY_APP_NAME \
  "$NOTIFY_VALUE" ""
