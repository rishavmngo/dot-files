#!/bin/bash

# Check battery level using the 'acpi' command and extract the percentage value

if upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -q "state:\s*charging"; then
  charging=false
else
  charging=true
fi

battery_level=$(acpi | grep -o '[0-9]\+%' | tr -d '%')

# Check if the battery level is less than 20%
if [[ $battery_level -lt 20 ]] && $charging; then
  # Send a notification using the 'notify-send' command
  notify-send -t 10000 -u critical "Battery level is low" "The battery level is currently at $battery_level"
fi
