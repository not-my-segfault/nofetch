#!/bin/bash

if ! test -f $FILE;
then
        curl -LO https://raw.githubusercontent.com/jnats/nofetch/main/nofetch
fi

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
        sudo cp nofetch /usr/bin
else
        echo "[/] neither sudo, nor doas found, using su"
        su - root "rm $(which nofetch > /dev/null 2>&1) > /dev/null 2>&1"
        chmod +x nofetch
        su - root "cp nofetch /usr/bin"
fi
