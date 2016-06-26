#!/bin/sh

ln -s ~/dotfiles/.zshrc ~/
ln -s ~/dotfiles/.bashrc ~/
ln -s ~/dotfiles/.Xdefaults ~/
ln -s ~/dotfiles/.xinitrc ~/
ln -s ~/dotfiles/.vim ~/
ln -s ~/dotfiles/.vimrc ~/

mkdir -p ~/.config
ln -s ~/dotfiles/.config/i3 ~/.config/
ln -s ~/dotfiles/.config/ranger ~/.config/ranger
ln -s ~/dotfiles/.config/sxhkd ~/.config/sxhkd
