#!/bin/bash

killall -q polybar

for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar --reload example &
done

#polybar example 2>&1 | tee -a /tmp/polybar.log & disown
echo "Polybar launched..."
