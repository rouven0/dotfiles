#!/bin/sh

ln -nfs /home/$USER/dotfiles/.vimrc /home/$USER/.vimrc
ln -nfs /home/$USER/dotfiles/.gitconfig /home/$USER/.gitconfig
ln -nfs /home/$USER/dotfiles/.Xresources /home/$USER/.Xresources

mkdir /home/$USER/.config/i3
mkdir /home/$USER/.config/i3status
ln -nfs /home/$USER/dotfiles/.config/i3/config /home/$USER/.config/i3/config
ln -nfs /home/$USER/dotfiles/.config/i3status/config /home/$USER/.config/i3status/config
