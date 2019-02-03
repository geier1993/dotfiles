#!/bin/sh
set -e  # stop on first error
gpg2 -d .pws.gpg > .pws
kak .pws
gpg2 -c .pws
shred .pws
rm .pws
