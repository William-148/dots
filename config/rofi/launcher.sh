#!/bin/bash
cd ~/.config/rofi/cyberpunk-1/

rofi -show drun \
  -theme "theme.rasi" \
  -run-command "uwsm app -- {cmd}"
