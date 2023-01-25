# EC_GIT_TAG='commit 79dbbd3 deployed by play g_complex_head_co,ac6-101 at 20220330_054131'

# Get more aliases and functions

#--------------------------------------------------------------------------#

# This block is required for obtaining a default ECMWF environment, 
# please do not remove this unless you appreciate the consequences

if [[ "$SHELL" == */bash* && -f ~/.bashrc ]]; then
    . ~/.bashrc
fi

#--------------------------------------------------------------------------#

# User specific environment and startup programs

export KAKSESSION=default

export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$PERM/.local/bin

. "/perm/mapg/.cargo/env"

alias fz="zellij-fzf"
alias r="joshuto"
