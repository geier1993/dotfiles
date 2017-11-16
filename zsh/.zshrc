#redshift-gtk & #done by i3

export XKB_DEFAULT_LAYOUT=us,de
export XKB_DEFAULT_VARIANT=dvorak,nodeadkeys
export XKB_DEFAULT_MODEL=pc105
export XKB_DEFAULT_OPTIONS=grp:switch,grp:menu_toggle

export XDG_CONFIG_HOME=/home/geier/.config

export WLC_REPEAT_DELAY=150
export WLC_REPEAT_RATE=50

export PYTHONPATH=$PYTHONPATH:/usr/local/lib/python2.7/site-packages/
export TERMINAL=urxvtc
export TERM=rxvt
export EDITOR=kak
export VISUAL=kak
export GOPATH=~/go

export PATH=$PATH:$GOPATH/bin:~/.local/bin:~/.cabal/bin:~/misc/dotfiles/bin
export LD_LIBRARY_PATH=/usr/local/lib:/home/geier/.local/lib:${LD_LIBRARY_PATH}

#export GDK_BACKEND=wayland
export QT_QPA_PLATFORM=wayland-egl
export CLUTTER_BACKEND=wayland
export SDL_VIDEODRIVER=wayland

# qt5-wayland had too large icons
#export GDK_BACKEND=wayland
#export QT_QPA_PLATFORMTHEME="qt5ct"
#export GDK_BACKEND=x11 some_qt_program
#export QT_SCALE_FACTOR=
#export QT_AUTO_SCREEN_SCALE_FACTOR=2
#export QT_QPA_PLATFORM=wayland-egl

if [ ! -z "$TMUX" ];
then
  export KAKSESSION=`tmux display-message -p "#{session_group}"`
fi


# # Start the gpg-agent if not already running
# if ! pgrep -x -u "${USER}" gpg-agent >/dev/null 2>&1; then
#   gpg-connect-agent /bye >/dev/null 2>&1
# fi

# # Set SSH to use gpg-agent
# unset SSH_AGENT_PID
# if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
#   export SSH_AUTH_SOCK="/run/user/$UID/gnupg/S.gpg-agent.ssh"
# fi

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
zstyle ':completion:*' rehash true

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

# export WISP=9C:65:B0:73:7D:AC

# eval $(gnome-keyring-daemon -s)
eval "$(pandoc --bash-completion)"

#eval $(thefuck --alias)

#FASD
eval "$(fasd --init auto)"
#function k () kak `fasd -f $@`

function sk {
  if [ ! -z "$KAKSESSION" ];
  then
    if [ ! -z `kak -l | grep "^${KAKSESSION}$"` ];
    then
      kak -c $KAKSESSION $@
    else
      kak -d -s $KAKSESSION 
      kak -c $KAKSESSION $@
    fi
  else
    kak $@
  fi
}

function k () sk `fasd -f $@`


#Stack
eval "$(stack --bash-completion-script stack)"

if [ -z "$NIX_CONF_DIR" ];
then
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  source /usr/share/zsh-navigation-tools/zsh-navigation-tools.plugin.zsh
  source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi
