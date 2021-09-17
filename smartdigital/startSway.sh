#!/bin/sh
###!/bin/bash

# export $(dbus-launch)
# export MESA_LOADER_DRIVER_OVERRIDE=i965
# exec systemctl --user import-environment

#eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
#export SSH_AUTH_SOCK

#.screenlayout/docking+1x17.sh
#.screenlayout/davis_office.sh

#moved to sway config
#[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
#urxvtd -q -f -o
#volnoti&
#dunst&

# pulseaudio --daemonize
# pasystray&
# nm-applet&

# sway -d 2> ~/sway.log
#exec ck-launch-session dbus-launch --sh-syntax --exit-with-session sway
#exec dbus-launch --sh-syntax --exit-with-session /usr/bin/sway -d 2> ~/sway.log
# /usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &
# lxqt-policykit-agent &
exec /usr/bin/ssh-agent /usr/bin/im-launch /usr/bin/sway --my-next-gpu-wont-be-nvidia
# exec /usr/bin/ssh-agent /usr/bin/im-launch /usr/bin/sway 
