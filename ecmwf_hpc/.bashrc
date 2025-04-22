# EC_GIT_TAG='commit 79dbbd3 deployed by play g_complex_head_co,ac6-101 at 20220330_054131'

#--------------------------------------------------------------------------#

# This block is required for obtaining a default ECMWF environment,
# please do not remove this unless you appreciate the consequences

if [[ -r /etc/bashrc ]]; then
    . /etc/bashrc
fi

set -o vi

#--------------------------------------------------------------------------#

# . "$HOME/.cargo/env"
. "/perm/mapg/.cargo/env"
export CARGO_HOME=$PERM/.cargo

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export KAKSESSION=default

export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$PERM/.local/bin

alias fz="zellij-fzf"
alias r="joshuto"

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
 
