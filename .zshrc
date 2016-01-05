# The following lines were added by compinstall

bindkey -v

zmodload zsh/zutil
zmodload zsh/complist

zstyle ':completion:*' menu select
zstyle ':completion:*' completer _expand _complete _ignored

#LS_COLORS='no=00;37:fi=00:di=00;33:ln=04;36:pi=40;33:so=01;35:bd=40;33;01:'
LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
export LS_COLORS
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
#zstyle ':completion:*' list-colors 'di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle :compinstall filename '/home/geier/.zshrc'

autoload -Uz compinit promptinit
autoload -U colors && colors
compinit
promptinit


#Prompt
set_prompt () {
    PROMPT="%{$fg_bold[white]%}%{$fg_bold[yellow]%}"`date +"%H:%M"`"%{$fg[white]$fg_no_bold[red]%} %c %{$fg_bold[white]%}%# %{$reset_color%}"
}
set_prompt
preexec () {
	#set_prompt
	timer=$((`date +%s`+`date +%N`/1e9))
}

precmd() {
    set_prompt
    if [ $timer ]; then
	timer_show=$(printf "%0.3f" $((`date +%s`+`date +%N`/1e9-$timer)))
        RPROMPT="%F{cyan}${timer_show}%{$reset_color%}"
        unset timer
    fi
}

#prompt pws
#prompt adam2
#prompt walters
#prompt redhat


#HELP
autoload -U run-help
autoload run-help-git
autoload run-help-svn
autoload run-help-svk
unalias run-help
alias help=run-help


#ls with color
alias ls='ls --color=auto'

# End of lines added by compinstall

#avoid freezing
ttyctl -f


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


