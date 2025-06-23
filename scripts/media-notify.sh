#!/bin/bash
NOTIFICATION_APP_NAME="$1" # volume | audio-mute | brightness | audio-play

# Notification types supported
readonly VOLUME_TYPE="volume"
readonly BRIGHTNESS_TYPE="brightness"
readonly AUDIO_MUTE_TYPE="audio-mute"
readonly AUDIO_PLAY_TYPE="audio-play"

VALUE=""
SHOW_PROGRESS_BAR=1

case "$NOTIFICATION_APP_NAME" in
"$VOLUME_TYPE")
  VALUE=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2 * 100}')
  ;;

"$BRIGHTNESS_TYPE")
  BRIGHTNESS=$(brightnessctl g)
  MAX=$(brightnessctl m)
  if [ -z "$BRIGHTNESS" ] || [ -z "$MAX" ]; then
    notify-send "Error geting brightness" --urgency=critical
    exit 1
  fi

  VALUE=$(awk "BEGIN { printf \"%d\", ($BRIGHTNESS / $MAX) * 100 }")
  ;;

"$AUDIO_MUTE_TYPE")
  SHOW_PROGRESS_BAR=0
  MUTED_STATUS=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $3}')
  VALUE="󱄠"

  if [ "$MUTED_STATUS" = "[MUTED]" ]; then
    VALUE="󰖁"
  fi
  ;;
"$AUDIO_PLAY_TYPE")
  SHOW_PROGRESS_BAR=0
  STATUS=$(sleep 0.1 && playerctl status)
  VALUE=""

  if [ "$STATUS" = "Playing" ]; then
    VALUE=""
  fi
  ;;
*)
  echo "Unknown type: $TYPE"
  exit 1
  ;;
esac

# SHOW NOTIFICATION
if [ $SHOW_PROGRESS_BAR = 1 ]; then
  notify-send \
    -a $NOTIFICATION_APP_NAME \
    -h string:x-canonical-private-synchronous:$NOTIFICATION_APP_NAME \
    -h int:value:$VALUE ""
else
  notify-send \
    -a $NOTIFICATION_APP_NAME \
    -h string:x-canonical-private-synchronous:"$NOTIFICATION_APP_NAME" \
    "$VALUE" ""
fi
