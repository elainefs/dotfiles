#!/bin/bash

TITLE=$(rofi -dmenu -p "Title: ")
FOLDER=$HOME/Notes/Inbox/
NEW_FILE="$FOLDER"/"$TITLE".md

if [[ -n "$TITLE" ]]; then
    already_exist=$(exec find $NEW_FILE)

    if [[ -n $already_exist ]]; then
        notify-send "A file with the same name already exists"
        exec $HOME/.local/bin/new-note.sh
    fi

    touch "$NEW_FILE"

    notify-send "New File $TITLE.md Created"

    cd $FOLDER
    exec kitty -e nvim "$NEW_FILE"
fi
