#!/bin/sh
# shell script to prepend i3status with more stuff

i3status | while :
do
        read line
        current_player=$(playerctl -l)
        if [ $current_player = ""]; then
                echo $line || exit 1
        else
                echo "Playing $current_player | $line" || exit 1
        fi;

done
