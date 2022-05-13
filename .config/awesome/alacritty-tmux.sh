#!/bin/bash
if ! [[ $(tmux list-sessions) ]]; then
	tmux new-session -d
fi
alacritty -e tmux attach
