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

alias m='ninja -j1 -k1'
alias mm='ninja'
alias mmm='ninja -k999999'
alias ll='ls -lh'
alias la='ls -Ah'
alias l='ls -CFh'
alias gd='git diff --color -w'
alias gg='git status'
alias gl="git log --pretty=format:'%C(yellow)%h %Cred%ai %Cblue%an%Cgreen%d %Creset%s' --date=short"
alias glp="git log --pretty=format:'%C(yellow)%h %Cred%ai %Cblue%an%Cgreen%d %Creset%s' --date=short --first-parent"
alias gta="git log --pretty=format:'%C(yellow)%h %Cred%ai %Cblue%an%Cgreen%d %Creset%s' --date=short --graph --all"
alias gtc="git log --pretty=format:'%C(yellow)%h %Cred%ai %Cblue%an%Cgreen%d %Creset%s' --date=short --graph"
alias gco='git checkout'
alias venv='(){deactivate 2&> /dev/null; source ~/python-venvs/$1/bin/activate ;}'
 

#FASD
eval "$(fasd --init auto)"
