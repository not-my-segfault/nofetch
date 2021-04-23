#!/bin/bash

if [ $EUID -eq 0 ]
then
        echo "[/] uid 0"
        chmod +x nofetch
        sudo cp nofetch /usr/local/bin
elif command -v doas &> /dev/null
then
        echo "[/] doas"
        chmod +x nofetch
        doas cp nofetch /usr/local/bin
elif command -v sudo &> /dev/null
then
        echo "[/] sudo"
        chmod +x nofetch
        sudo cp nofetch /usr/local/bin
else
        echo "\n[X] neither doas nor sudo found, and command isn't running as root, have you checked README.md ?\n"
fi
