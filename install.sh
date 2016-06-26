#!/bin/sh

ln -s ~/dotfiles/.zshrc ~/
ln -s ~/dotfiles/.bashrc ~/
ln -s ~/dotfiles/.Xdefaults ~/
ln -s ~/dotfiles/.xinitrc ~/
ln -s ~/dotfiles/.vim ~/
ln -s ~/dotfiles/.vimrc ~/

mkdir -p ~/.config/i3
mkdir -p ~/.config/ranger
mkdir -p ~/.config/sxhkd
ln -s ~/dotfiles/i3/config ~/.config/i3/config
ln -s ~/dotfiles/i3/i3blocks.conf ~/.config/i3/i3blocks.conf
ln -s ~/dotfiles/ranger/rc.conf ~/.config/ranger/rc.conf
ln -s ~/dotfiles/sxhkd/sxhkdrc ~/.config/sxhkd/sxhkdrc
