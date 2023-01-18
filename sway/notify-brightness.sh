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

case $1 in
    up)
	brightnessctl set +5% > /dev/null
	send_notification
	;;
    down)
	brightnessctl set 5%- > /dev/null
	send_notification
	;;
esac

