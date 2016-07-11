#!/bin/sh
xbacklight -set 50
while true
do
	battery_percentage=$(acpi -b | grep -P -o '[0-9]+(?=%)')
	if on_ac_power; then
		if [ "$battery_percentage" -eq 100 ]; then
			export DISPLAY=:0.0
			notify-send -i "/usr/local/bin/battery_full.jpg" "Battery full." "Level: ${battery_percentage}% ";
			espeak "Please Remove Charger";
		fi
	else
		if [ "$battery_percentage" -lt 10 ]; then
			export DISPLAY=:0.0
			notify-send -i "/usr/local/bin/battery_low.jpg" "Battery Low." "Level: ${battery_percentage}% ";
			espeak "Please Switch on Charger";
		fi
	fi
	sleep 10
done
