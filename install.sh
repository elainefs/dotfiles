#!/bin/bash

DOTFILES=$HOME/dotfiles

# Download dotfiles
cd $HOME
git clone https://github.com/elainefs/dotfiles.git

echo -n "Set .bashrc? [Y/n] "
read bashrc
if [ "$bashrc" == "y" -o "$bashrc" == "Y" -o "$bashrc" == "" ]; then
    rm -f $HOME/.bashrc
    ln -s $DOTFILES/.bashrc $HOME/.bashrc
fi

echo -n "Set .bash_aliases? [Y/n] "
read bash_aliases
if [ "$bash_aliases" == "y" -o "$bash_aliases" == "Y" -o "$bash_aliases" == "" ]; then
    rm -f $HOME/.bash_aliases
    ln -s $DOTFILES/.bash_aliases $HOME/.bash_aliases
fi

echo -n "Set .tmux.conf? [Y/n] "
read tmux
if [ "$tmux" == "y" -o "$tmux" == "Y" -o "$tmux" == "" ]; then
    rm -f $HOME/.tmux.conf
    ln -s $DOTFILES/.tmux.conf $HOME/.tmux.conf
fi

echo -n "Set .vimrc? [Y/n] "
read vimrc
if [ "$vimrc" == "y" -o "$vimrc" == "Y" -o "$vimrc" == "" ]; then
    rm -f $HOME/.vimrc
    ln -s $DOTFILES/.vimrc $HOME/.vimrc
fi

echo "==================="
echo "### Set .config ###"
echo "==================="

echo -n "Set kitty terminal? [Y/n] "
read kitty
if [ "$kitty" == "y" -o "$kitty" == "Y" -o "$kitty" == "" ]; then
    rm -rf $HOME/.config/kitty/
    ln -s $DOTFILES/.config/kitty/ $HOME/.config/
fi

echo -n "Set nvim? [Y/n] "
read nvim
if [ "$nvim" == "y" -o "$nvim" == "Y" -o "$nvim" == "" ]; then
    rm -rf $HOME/.config/nvim/
    ln -s $DOTFILES/.config/nvim/ $HOME/.config/
fi

echo -n "Set sway? [Y/n] "
read sway
if [ "$sway" == "y" -o "$sway" == "Y" -o "$sway" == "" ]; then
    rm -rf $HOME/.config/sway/
    ln -s $DOTFILES/.config/sway/ $HOME/.config/

    sudo chmod +x ~/.config/sway/scripts/power.sh
    sudo chmod +x ~/.config/sway/scripts/screenshot.sh
    sudo chmod +x ~/.config/sway/scripts/wallpaper.sh
    sudo chmod +x ~/.config/sway/scripts/window-switcher.sh
fi

echo -n "Set swaylock? [Y/n] "
read swaylock
if [ "$swaylock" == "y" -o "$swaylock" == "Y" -o "$swaylock" == "" ]; then
    rm -rf $HOME/.config/swaylock/
    ln -s $DOTFILES/.config/swaylock/ $HOME/.config/
fi

echo -n "Set swayppy? [Y/n] "
read swayppy
if [ "$swayppy" == "y" -o "$swayppy" == "Y" -o "$swayppy" == "" ]; then
    rm -rf $HOME/.config/swappy/
    ln -s $DOTFILES/.config/swappy/ $HOME/.config/
fi

echo -n "Set waybar? [Y/n] "
read waybar
if [ "$waybar" == "y" -o "$waybar" == "Y" -o "$waybar" == "" ]; then
    rm -rf $HOME/.config/waybar/
    ln -s $DOTFILES/.config/waybar/ $HOME/.config/
fi

echo -n "Set rofi? [Y/n] "
read rofi
if [ "$rofi" == "y" -o "$rofi" == "Y" -o "$rofi" == "" ]; then
    rm -rf $HOME/.config/rofi/
    ln -s $DOTFILES/.config/rofi/ $HOME/.config/
fi

echo -n "Set swaync? [Y/n] "
read swaync
if [ "$swaync" == "y" -o "$swaync" == "Y" -o "$swaync" == "" ]; then
    rm -rf $HOME/.config/swaync/
    ln -s $DOTFILES/.config/swaync/ $HOME/.config/
fi

echo -n "Set mako? [Y/n] "
read mako
if [ "$mako" == "y" -o "$mako" == "Y" -o "$mako" == "" ]; then
    rm -rf $HOME/.config/mako/
    ln -s $DOTFILES/.config/mako/ $HOME/.config/
fi

echo "=================="
echo "### Set .local ###"
echo "=================="

echo -n "Set bin/alarm.sh? [Y/n] "
read alarm
if [ "$alarm" == "y" -o "$alarm" == "Y" -o "$alarm" == "" ]; then
    rm -f $HOME/.local/bin/alarm.sh
    ln -s $DOTFILES/.local/bin/alarm.sh $HOME/.local/bin/
fi

echo -n "Set bin/new-note.sh? [Y/n] "
read note
if [ "$note" == "y" -o "$note" == "Y" -o "$note" == "" ]; then
    rm -f $HOME/.local/bin/new-note.sh
    ln -s $DOTFILES/.local/bin/new-note.sh $HOME/.local/bin/
fi

echo -n "Set bin/flameshot-wayland.sh? [Y/n] "
read flameshot
if [ "$flameshot" == "y" -o "$flameshot" == "Y" -o "$flameshot" == "" ]; then
    rm -f $HOME/.local/bin/flameshot-wayland.sh
    ln -s $DOTFILES/.local/bin/flameshot-wayland.sh $HOME/.local/bin/
fi
