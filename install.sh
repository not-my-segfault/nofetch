#!/bin/bash

if [ $EUID -eq 0 ]
then
        if [ $DEBUG -eq 1 ]
        then
                echo "[/] uid 0"
        fi
        chmod +x nofetch
        sudo cp nofetch /usr/local/bin
elif command -v doas &> /dev/null
then
        if [ $DEBUG -eq 1 ]
        then
                echo "[/] doas"
        fi
        chmod +x nofetch
        doas cp nofetch /usr/local/bin
elif command -v sudo &> /dev/null
then
        if [ $DEBUG -eq 1 ]
        then
                echo "[/] sudo"
        fi
        chmod +x nofetch
        sudo cp nofetch /usr/local/bin
else
        echo "\n[X] neither doas nor sudo found, and command isn't running as root, have you checked README.md ?\n"
fi
