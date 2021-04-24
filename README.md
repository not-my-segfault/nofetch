# nofetch
the fetch tool that outputs nothing

ever get sick and tired of all of those xfetch tools on r/unixporn?
ever just want a no-bullshit fetch?

look no further than nofetch.

simply run `nofetch`, and watch all of your r/unixporn problems go away.

![](screenshot.png)

## install instructions

- make sure `install.sh` is executable

  `chmod +x install.sh`

- run install.sh

## dependencies

- a shell would help

- doas or sudo (otherwise, run install.sh as root)

## os compatability

realistically any system that has the following

- bash, or any other POSIX compliant shell (will have to change the shabang in both install and nofetch itself first)
- grep
- head
- sed
- cat
- /etc/os-release
