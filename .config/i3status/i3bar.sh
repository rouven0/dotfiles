#!/bin/sh
# shell script to prepend i3status with more stuff

i3status | while :
do
        read line
        current_player=$(playerctl -l | head -1 | cut -d "." -f1)
        player_status=$(playerctl status)

        if [ "$current_player" = "" ]; then
                echo "$line" || exit 1
        else
                echo "$player_status $current_player | $line" || exit 1
        fi;

done
