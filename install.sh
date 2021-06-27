#!/bin/sh

ln -nfs /home/$USER/dotfiles/.vimrc /home/$USER/.vimrc
ln -nfs /home/$USER/dotfiles/.gitconfig /home/$USER/.gitconfig

mkdir /home/$USER/.config/i3
mkdir /home/$USER/.config/i3status
mkdir /home/$USER/.config/dunst
ln -nfs /home/$USER/dotfiles/.config/i3/config /home/$USER/.config/i3/config
ln -nfs /home/$USER/dotfiles/.config/i3status/config /home/$USER/.config/i3status/config
ln -nfs /home/$USER/dotfiles/.config/dunst/dunstrc /home/$USER/.config/dunst/dunstrc
