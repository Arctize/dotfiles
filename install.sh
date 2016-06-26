#!/bin/sh

ln -si ~/.dotfiles/.zshrc ~/
ln -si ~/.dotfiles/.bashrc ~/
ln -si ~/.dotfiles/.Xdefaults ~/
ln -si ~/.dotfiles/.xinitrc ~/
ln -si ~/.dotfiles/.vim ~/
ln -si ~/.dotfiles/.vimrc ~/

mkdir -p ~/.config/i3
mkdir -p ~/.config/ranger
mkdir -p ~/.config/sxhkd
ln -si ~/.dotfiles/i3/config ~/.config/i3/config
ln -si ~/.dotfiles/i3/i3blocks.conf ~/.config/i3/i3blocks.conf
ln -si ~/.dotfiles/ranger/rc.conf ~/.config/ranger/rc.conf
ln -si ~/.dotfiles/sxhkd/sxhkdrc ~/.config/sxhkd/sxhkdrc
