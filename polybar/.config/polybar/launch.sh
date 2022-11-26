#!/bin/fish

killall -q polybar
polybar polyBar 2>&1 | tee -a /tmp/polybar.log & disown

