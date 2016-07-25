#redshift-gtk & #done by i3


PYTHONPATH=$PYTHONPATH:/usr/local/lib/python2.7/site-packages/:~/misc/Jobman/
export PYTHONPATH

TERMINAL=urxvtc
export TERMINAL

export TERM=rxvt

EDITOR=kak
export EDITOR

VISUAL=kak
export VISUAL 

export GOPATH=~/go

PATH=$PATH:$GOPATH/bin:~/.cabal/bin:~/misc/dotfiles/bin:~/misc/Jobman/bin:/opt/junest/bin
export PATH

#Intel C++ Studio
if [ -d /opt/intel ];
then
    export INTEL_HOME=/opt/intel
    export PATH=${PATH}:${INTEL_HOME}/bin
    export LD_LIBRARY_PATH=/opt/intel/mkl/lib/intel64:/opt/intel/lib/intel64:${LD_LIBRARY_PATH}
fi



# The following lines were added by compinstall
plugins+=(zsh-completions)
plugins+=(zsh-highlighters)

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

autoload bashcompinit
bashcompinit



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
	timer_show=$(printf "%0.1f" $((`date +%s`+`date +%N`/1e9-$timer)))
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
#unalias run-help
alias help=run-help


#ls with color
alias ls='ls --color=auto'

# End of lines added by compinstall

#avoid freezing
ttyctl -f

#Adjust X keyboard rate
#use systemd for that...
#xset r rate 200 60

WISP=9C:65:B0:73:7D:AC
export WISP

eval "$(pandoc --bash-completion)"

eval $(thefuck --alias)

#FASD
eval "$(fasd --init auto)"
function k () kak `fasd -f $@`
