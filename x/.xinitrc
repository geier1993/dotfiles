#!/bin/bash

# Make sure this is before the 'exec' command or it won't be sourced.
# [ -f /etc/xprofile ] && . /etc/xprofile
# [ -f ~/.xprofile ] && . ~/.xprofile

#exec i3 -V >> ~/i3log-$(date +'%F-%k-%M-%S') 2>&1
#.i3/restartscript &
#exec i3 
#exec i3 -V >> ~/i3log-$(date +'%F-%k-%M-%S') 2>&1
#exec sway
#i3-msg restart
#exec redshift-gtk 

exec enlightenment_start

#./start_jack.sh
