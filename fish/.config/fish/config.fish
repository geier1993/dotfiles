fish_vi_key_bindings

if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

set -x PYTHONPATH (python -c "import site; print(site.USER_SITE)"):$PYTHONPATH
set -x TERMINAL urxvtc
set -x TERM rxvt
set -x EDITOR skk
set -x VISUAL skk
set -x PAGER less
set -x GOPATH ~/go
set -x GEM_HOME (ruby -e 'print Gem.user_dir')
set -x npm_config_prefix ~/.node_modules

set -x PKG_CONFIG_PATH $PKG_CONFIG_PATH $HOME/.local/lib/pkgconfig
set -x PATH $PATH $GOPATH/bin $HOME/.local/bin $HOME/.cabal/bin $HOME/misc/dotfiles/bin $HOME/.gem/ruby/2.5.0/bin $HOME/.node_modules/bin $HOME/.cargo/bin $PATH
set -x LD_LIBRARY_PATH $LD_LIBRARY_PATH /usr/local/lib $HOME/.local/lib $HOME/.nix-profile/lib


if test -z $KAKSESSION
    if not test -z $TMUX
      set KAKSESSION (tmux display-message -p "#{session_group}")
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

    function ls
        command grc --colour=auto ls $argv
    end
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
