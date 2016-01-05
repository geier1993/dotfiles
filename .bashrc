#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

#redshift-gtk &
PATH=$PATH:/home/geier/.cabal/bin
export PATH

PYTHONPATH=$PATH:$PYTHONPATH:/usr/local/lib/python2.7/site-packages/
export PYTHONPATH

TERMINAL=urxvtc
export TERMINAL

EDITOR=vim
export EDITOR 

VISUAL=gvim
export VISUAL 

#FASD
eval "$(fasd --init auto)"
