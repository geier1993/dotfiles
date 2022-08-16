fish_vi_key_bindings

if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

set -x PYTHONPATH (python -c "import site; print(site.USER_SITE)"):$PYTHONPATH
# set -x TERMINAL urxvtc
# set -x TERM rxvt
set -x TERM xterm-256color
set -x EDITOR skk
set -x VISUAL skk
set -x PAGER less
set -x GOPATH ~/go
set -x GEM_HOME (ruby -e 'print Gem.user_dir')
set -x npm_config_prefix ~/.node_modules

set -x PKG_CONFIG_PATH $PKG_CONFIG_PATH $HOME/.local/lib/pkgconfig
set -x PATH $GOPATH/bin $HOME/.local/bin $HOME/.cabal/bin $HOME/misc/dotfiles/bin $HOME/.gem/ruby/2.5.0/bin $HOME/.node_modules/bin $HOME/.cargo/bin $PATH
set -x LD_LIBRARY_PATH $LD_LIBRARY_PATH /usr/local/lib $HOME/.local/lib $HOME/.nix-profile/lib


if test -z $KAKSESSION
    if not test -z $TMUX
      set -x KAKSESSION (tmux display-message -p "#{session_group}")
    else if not test -z $ZELLIJ_SESSION_NAME
      set -x KAKSESSION $ZELLIJ_SESSION_NAME
    end
end


alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias z='fasd_cd -d'     # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # cd with interactive selection
alias r='ranger'

alias g='git'

alias gs='git status'

alias jqt="jupyter qtconsole"
alias dbw="databricks workspace"



function k
    command skk (fasd -f $argv)
end

function onLinux
    function withPython
        if test -f ~/.venv/bin/activate
          . ~/.venv/bin/activate.fish
        end
    end

    function ls
        command ls --color=auto $argv
    end
end

function onMac
    # Source nix..
     # Nix is now handled by fisher add lilyball/nix-env.fish
     # . $HOME/.nix-profile/etc/profile.d/nix.sh
     alias codium=(nix-locate VSCodium.app/Contents/Resources/app/bin/code | awk '{print $NF}')
    # commands for OS X go here
    function withPython
        if test -f ~/pythonGisEnv/bin/activate
          . ~/pythonGisEnv/bin/activate.fish
        end
    end

    set -x PATH /opt/homebrew/opt/util-linux/bin $PATH
    set -x PATH /opt/homebrew/opt/util-linux/sbin $PATH
    set -U fish_user_paths /opt/homebrew/bin $fish_user_paths

    # function ls
    #     command grc --colour=auto ls $argv
    # end
end

function onOther
end

switch (uname)
    case Linux
        onLinux
    case Darwin
        onMac
    case '*'
        onOther
end

# https://gist.github.com/gabesoft/b6e5e959c4cb11ed257d41edb07d47cb
# Fish function for browsing the git commit using fzf and diff-so-fancy 
function gbr --description "Git browse commits"
    set -l log_line_to_hash "echo {} | grep -o '[a-f0-9]\{7\}' | head -1"
    set -l view_commit "$log_line_to_hash | xargs -I % sh -c 'git show --color=always % | diff-so-fancy | less -R'"
    set -l copy_commit_hash "$log_line_to_hash | xsel -i -b"
    set -l git_checkout "$log_line_to_hash | xargs -I % sh -c 'git checkout %'"
    set -l open_cmd "open"

    if test (uname) = Linux
        set open_cmd "xdg-open"
    end

    set github_open "$log_line_to_hash | xargs -I % sh -c '$open_cmd https://github.\$(git config remote.origin.url | cut -f2 -d. | tr \':\' /)/commit/%'"

    git log --color=always --graph --format='%C(auto)%h%d %s %C(green)%C(bold)%cr% C(blue)%an' | \
        fzf --no-sort --reverse --tiebreak=index --no-multi --ansi \
            --preview="$view_commit" \
            --header="ENTER to view, CTRL-Y to copy hash, CTRL-O to open on GitHub, CTRL-X to checkout, CTRL-C to exit" \
            --bind "enter:execute:$view_commit" \
            --bind "ctrl-y:execute:$copy_commit_hash" \
            --bind "ctrl-x:execute:$git_checkout" \
            --bind "ctrl-o:execute:$github_open"
end
