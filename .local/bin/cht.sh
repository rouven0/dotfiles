#!/bin/bash
# Credits to the primeagen
selected=`cat ~/.config/tmux/cht-languages ~/.config/tmux/cht-command | fzf`
if [[ -z $selected ]]; then
    exit 0
fi

read -p "Enter Query: " query

query=`echo $query | tr ' ' '+'`
tmux neww bash -c "curl cht.sh/$selected/$query & while [ : ]; do sleep 1; done"

