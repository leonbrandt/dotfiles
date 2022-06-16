#!/bin/bash

TARGET=$1

if ! [[ $TARGET =~ ^[0-9]+$ ]]; then
	echo "NaN"
	exit
fi

if (( $TARGET < 0 || $TARGET > 100 )); then
	echo "OUT OF RANGE"
	exit
fi

VOL=$(bc <<< "scale=2; $TARGET / 100")

echo $VOL

dbus-send --print-reply --session --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Set string:org.mpris.MediaPlayer2.Player string:Volume variant:double:$VOL > /dev/null 2>&1
