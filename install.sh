#!/bin/bash
mkdir Output                                                   
if [ -x "$(command -v pacman)" ]; then
     pacman -Sy nmap hydra masscan
elif [ -x "$(command -v apt)" ]; then
     apt install nmap hydra masscan
fi
