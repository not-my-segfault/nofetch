#!/usr/bin/env bash

file=nofetch
url=https://raw.githubusercontent.com/jnats/nofetch/main/nofetch

if ! test -f $file;
then
        curl -LO $url
fi

if [ $EUID -eq 0 ]
then
        echo "[/] uid 0"
        rm $(which $file > /dev/null 2>&1) > /dev/null 2>&1
        chmod +x $file
        mkdir -p /usr/local/bin
        cp $file /usr/local/bin
elif command -v doas &> /dev/null
then
        echo "[/] doas"
        doas rm $(which $file > /dev/null 2>&1) > /dev/null 2>&1
        chmod +x $file
        doas mkdir -p /usr/local/bin
        doas cp $file /usr/local/bin
elif command -v sudo &> /dev/null
then
        echo "[/] sudo"
        sudo rm $(which $file > /dev/null 2>&1) > /dev/null 2>&1
        chmod +x $file
        sudo mkdir -p /usr/local/bin
        sudo cp $file /usr/local/bin
else
        echo "\n[X] neither doas nor sudo found, and command isn't running as root, have you checked README.md ?\n"
fi
