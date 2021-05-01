#!/usr/bin/env bash

file=nofetch
url=https://raw.githubusercontent.com/jnats/nofetch/main/nofetch

if [ ! -f $file ]
then
	curl -LO $url
fi

echo ""
echo "1 - install systemwide"
echo "2 - install for me"
echo ""
read uc

if [ "$uc" == "1" ]
then
        if [ $EUID -eq 0 ]
        then
		echo ""
                echo "[/] uid 0"
		echo ""
                rm $(which $file > /dev/null 2>&1) > /dev/null 2>&1
                chmod +x $file
                mkdir -p /usr/local/bin
                cp $file /usr/local/bin
        elif command -v doas &> /dev/null
        then
		echo ""
                echo "[/] doas"
		echo ""
                doas rm $(which $file > /dev/null 2>&1) > /dev/null 2>&1
                chmod +x $file
                doas mkdir -p /usr/local/bin
                doas cp $file /usr/local/bin
        elif command -v sudo &> /dev/null
        then
		echo ""
                echo "[/] sudo"
		echo ""
                sudo rm $(which $file > /dev/null 2>&1) > /dev/null 2>&1
                chmod +x $file
                sudo mkdir -p /usr/local/bin
                sudo cp $file /usr/local/bin
        else
                echo "\n[X] neither doas nor sudo found, and command isn't running as root, have you checked README.md ?\n"
        fi
elif [ "$uc" == "2" ]
then
	echo ""
        echo "> what is your preferred local binary directory? (make sure it exists and is in your \$PATH)"
	echo ""

        read localbin_up
	localbin=$(echo $localbin_up | sed "s|~|$HOME|g")
	echo ""
        chmod +x $file
        cp $file $localbin/
else
	echo ""
	echo "> invalid option, check syntax and try again"
	echo ""
fi
