#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use
# polybar-msg cmd quit

# Otherwise you can use the nuclear option:
killall -q polybar

if type "xrandr"; then
  for m in $(polybar --list-monitors | cut -d":" -f1); do
    if [[ $m == "HDMI-0" ]]; then
      MONITOR=$m polybar --reload main_landscape &
    elif [[ $m == "DP-0" ]]; then
      MONITOR=$m polybar --reload main_portrait &
    else
      MONITOR=$m polybar --reload main_landscape &
    fi
  done
else
  polybar --reload main &
fi

echo "Bars launched..."
