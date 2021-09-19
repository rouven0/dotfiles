#!/bin/sh

CONFIRMATION=$(echo "No\nYes" | dmenu -p "Do you really want to exit i3?")

if [ $CONFIRMATION = "Yes" ]; then
        i3-msg exit
fi
