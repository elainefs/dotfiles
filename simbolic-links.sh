#!/bin/bash

DOTFILES=$HOME/dotfiles

# Download dotfiles
cd $HOME
git clone https://github.com/elainefs/dotfiles.git

# .bashrc
rm -rf $HOME/.bashrc
ln -s $DOTFILES/.bashrc $HOME/.bashrc

# .bash_aliases
rm -rf $HOME/.bash_aliases
ln -s $DOTFILES/.bash_aliases $HOME/.bash_aliases

# tmux
rm -rf $HOME/.tmux.conf
ln -s $DOTFILES/.tmux.conf $HOME/.tmux.conf

# vim
rm -rf $HOME/.vimrc
ln -s $DOTFILES/.vimrc $HOME/.vimrc

# kitty
rm -rf $HOME/.config/kitty/
ln -s $DOTFILES/kitty/ $HOME/.config/

# nvim
rm -rf $HOME/.config/nvim/
ln -s $DOTFILES/nvim/ $HOME/.config/

# sway
rm -rf $HOME/.config/sway/
ln -s $DOTFILES/sway/sway/ $HOME/.config/

# swaylock
rm -rf $HOME/.config/swaylock/
ln -s $DOTFILES/sway/swaylock/ $HOME/.config/

# swappy
rm -rf $HOME/.config/swappy/
ln -s $DOTFILES/sway/swappy/ $HOME/.config/

#waybar
rm -rf $HOME/.config/waybar/
ln -s $DOTFILES/sway/waybar/ $HOME/.config/

# rofi
rm -rf $HOME/.config/rofi/
ln -s $DOTFILES/sway/rofi/ $HOME/.config/

# mako
rm -rf $HOME/.config/mako/
ln -s $DOTFILES/sway/mako/ $HOME/.config/
