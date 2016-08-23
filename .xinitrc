#!/bin/bash

eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

.screenlayout/docking+1x17.sh
#.screenlayout/davis_office.sh
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
urxvtd -q -f -o
volnoti&

dunst&
#exec startdde

pasystray&
nm-applet&
xbindkeys

xset r rate 200 60
#exec i3 -V >> ~/i3log-$(date +'%F-%k-%M-%S') 2>&1
#.i3/restartscript &
exec i3 
#i3-msg restart
#exec redshift-gtk 

#./start_jack.sh
