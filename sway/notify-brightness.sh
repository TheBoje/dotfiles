#!/bin/bash

# Usage:
# $ ./notify-brightness.sh up
# OR
# $ ./notify-brightness.sh down

# TODO: Add icons!

function get_brightness {
    brightnessctl g
}

function send_notification {
    brightness=$(get_brightness)
    # Send the notification
    notify-send -u normal "Brightness $((brightness/15))%" -h int:value:"$((brightness/15))" -h string:synchronous:volume
}

function get_keyboard_brightness {
    cat /sys/class/leds/asus::kbd_backlight/brightness
}

function next_keyboard_backlight {
    brightness=$(get_keyboard_brightness)
    nextbrightness=$((($brightness+1)%4))
    brightnessctl --device='asus::kbd_backlight' set $nextbrightness > /dev/null
}

case $1 in
    up)
	brightnessctl set +5% > /dev/null
	send_notification
	;;
    down)
	brightnessctl set 5%- > /dev/null
	send_notification
	;;
    keyboard)
    next_keyboard_backlight
    ;;
esac

