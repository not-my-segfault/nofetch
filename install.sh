#!/bin/bash

if [ $EUID -eq 0 ]
then
        echo "[/] uid 0"
        rm $(which nofetch > /dev/null 2>&1) > /dev/null 2>&1
        chmod +x nofetch
        cp nofetch /usr/local/bin
elif command -v doas &> /dev/null
then
        echo "[/] doas"
        doas rm $(which nofetch > /dev/null 2>&1) > /dev/null 2>&1
        chmod +x nofetch
        doas cp nofetch /usr/local/bin
elif command -v sudo &> /dev/null
then
        echo "[/] sudo"
        sudo rm $(which nofetch > /dev/null 2>&1) > /dev/null 2>&1
        chmod +x nofetch
        sudo cp nofetch /usr/local/bin
else
        echo "[/] neither sudo, nor doas found, run this script as root for it to work"
fi
