#!/bin/sh

killall -q polybar

# Wait until all polybar instances have died
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

for m in $(polybar --list-monitors | cut -d":" -f1); do
    # Launch all the bars
    MONITOR=$m polybar --reload ws &
    MONITOR=$m polybar --reload info &
done
