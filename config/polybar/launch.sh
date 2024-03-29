#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar main -c ~/.config/polybar/config.ini

# Launch bottom bar on all monitors
for i in $(polybar -m | awk -F: '{print $1}');
do MONITOR=$i polybar main -c ~/.config/polybar/config.ini & done

echo "Bars launched..."
