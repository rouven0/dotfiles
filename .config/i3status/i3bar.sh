#!/bin/sh
# shell script to prepend i3status with more stuff

i3status | while :
do
        read line
        current_player=$(playerctl -l | head -1 | cut -d "." -f1)
        player_status=$(playerctl status)
        current_layout=$(setxkbmap -query | grep layout | cut -d " " -f6)
        current_variant=$(setxkbmap -query | grep variant | cut -d " " -f5)

        if [ "$current_player" = "" ]; then
                echo "$line | $current_layout $current_variant" || exit 1
        else
                echo "$player_status $current_player | $line | $current_layout $current_variant" || exit 1
        fi;

done
