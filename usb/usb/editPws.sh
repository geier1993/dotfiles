#!/bin/sh
#set -e  # stop on first error
if gpg2 -d .pws.gpg > .pws ; then
kak .pws
gpg2 -c .pws
shred .pws
rm .pws
fi
