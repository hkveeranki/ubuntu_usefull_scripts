#!/bin/sh
while true
do
	export DISPLAY=:0.0
	battery_percentage=$(acpi -b | grep -P -o '[0-9]+(?=%)')
	if on_ac_power; then
		if [ "$battery_percentage" -eq 100 ]; then
			notify-send -i "$PWD/battery_full.jpg" "Battery full." "Level: ${battery_percentage}% ";
			espeak "Please Remove Charger";
		fi
	else
		if [ "$battery_percentage" -lt 20 ]; then
			notify-send -i "$PWD/battery_low.jpg" "Battery Low." "Level: ${battery_percentage}% ";
			espeak "Please Switch on Charger";
		fi
	fi
	sleep 10
done
