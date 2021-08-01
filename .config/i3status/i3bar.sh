#!/bin/sh
# shell script to prepend i3status with more stuff

i3status | while :
do
        read line
        current_player=$(playerctl -l)
        player_status=$(playerctl status)
        
        echo $status_symbol

        if [ $current_player = "" ]; then
                echo $line || exit 1
        else
                echo "$player_status $current_player $status_symbol| $line" || exit 1
        fi;

done
