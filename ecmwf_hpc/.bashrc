# EC_GIT_TAG='commit 79dbbd3 deployed by play g_complex_head_co,ac6-101 at 20220330_054131'

#--------------------------------------------------------------------------#

# This block is required for obtaining a default ECMWF environment,
# please do not remove this unless you appreciate the consequences

if [[ -r /etc/bashrc ]]; then
    . /etc/bashrc
fi

set -o vi

#--------------------------------------------------------------------------#

. "$HOME/.cargo/env"
. "/perm/mapg/.cargo/env"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
