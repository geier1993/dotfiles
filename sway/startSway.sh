#!/bin/sh
###!/bin/bash

#export $(dbus-launch)

#eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
#export SSH_AUTH_SOCK

#.screenlayout/docking+1x17.sh
#.screenlayout/davis_office.sh

#moved to sway config
#[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
#urxvtd -q -f -o
#volnoti&
#dunst&

#pulseaudio --daemonize
#pasystray&
#nm-applet&

#sway -d 2> ~/sway.log 
#exec ck-launch-session dbus-launch --sh-syntax --exit-with-session sway
exec dbus-launch --sh-syntax --exit-with-session sway
