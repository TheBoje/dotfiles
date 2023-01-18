#!/bin/bash

# Usage:
# $ ./notify-volume.sh up|down|micup|micdown|muteaudio|mutemic

# TODO: Add icons!

function get_volume {
    pamixer --get-volume-human
}

function send_notification {
    volume=$(get_volume)
    # send the notification
    if [ $volume != "muted" ]
    then
        notify-send -u normal "volume $volume" -h int:value:"$volume" -h string:synchronous:volume
    else
        notify-send -u normal "muted sound"
    fi
}

case $1 in
    up)
	pactl set-sink-volume @DEFAULT_SINK@ +5% > /dev/null
	send_notification
    ;;
    micup)
    pactl set-source-volume @DEFAULT_SOURCE@ +5% > /dev/null
    ;;
    down)
	pactl set-sink-volume @DEFAULT_SINK@ -5% > /dev/null
	send_notification
	;;
    micdown)
    pactl set-source-volume @DEFAULT_SOURCE@ -5% > /dev/null
    ;;
    muteaudio)
    pactl set-sink-mute @DEFAULT_SINK@ toggle > /dev/null
    send_notification
    ;;
    mutemic)
    pactl set-source-mute @DEFAULT_SOURCE@ toggle > /dev/null
    send_notification
    ;;
esac

