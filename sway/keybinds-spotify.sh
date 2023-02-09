#!/bin/bash

# Usage:
# $ ./keybinds-spotify.sh toggle
# OR
# $ ./keybinds-spotify.sh next
# OR 
# $ ./keybinds-spotify.sh previous

# TODO: Add icons!

case $1 in
    toggle)
	dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause > /dev/null
	;;
    next)
	dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next > /dev/null
	;;
    previous)
	dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous > /dev/null
	;;
esac

