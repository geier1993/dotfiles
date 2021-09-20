#!/bin/sh

TARGET=~/

stow -t $TARGET bin
stow -t $TARGET emacs
# stow -t $TARGET fish
stow -t $TARGET zsh
stow -t $TARGET direnv
stow -t $TARGET bash
stow -t $TARGET x
stow -t $TARGET terminator
stow -t $TARGET termite
stow -t $TARGET kitty
stow -t $TARGET tmux
#stow -t $TARGET stack
#stow -t $TARGET i3blocks
stow -t $TARGET zathura
stow -t $TARGET ranger
stow -t $TARGET readline
stow -t $TARGET dunst
stow -t $TARGET nixpkgs
stow -t $TARGET conky
stow -t $TARGET vim
stow -t $TARGET gnupg
stow -t $TARGET kak
stow -t $TARGET pycodestyle
stow -t $TARGET fzf
stow -t $TARGET vimb
stow -t $TARGET networkmanager-dmenu
stow -t $TARGET rofi
stow -t $TARGET systemd
stow -t $TARGET ssh
stow -t $TARGET usb
stow -t $TARGET Code
# stow -t $TARGET kde

case `uname` in
  Darwin)
    # commands for OS X go here
    stow -t $TARGET yabai
    stow -t $TARGET skhd
    stow -t $TARGET mac
    #stow -t $TARGET osx-compose-key
    # DefaultKeyBindings.dict must not be a symlink
    mkdir -p ~/Library/KeyBindings/
    cp osx-compose-key/Library/KeyBindings/DefaultKeyBinding.dict ~/Library/KeyBindings/
    stow -t $TARGET karabiner

    [[ ! -f "~/Library/Application\ Support/VSCodium" ]] && ln -s ~/.config/Code ~/Library/Application\ Support/VSCodium
  ;;
  Linux)
    # commands for Linux go here
    stow -t $TARGET sway
    stow -t $TARGET swaylock
    stow -t $TARGET kanshi
    stow -t $TARGET mako
    stow -t $TARGET waybar
    stow -t $TARGET foot
    stow -t $TARGET flashfocus
    stow -t $TARGET swaynag
    stow -t $TARGET nwg-launchers
    # stow -t $TARGET i3
  ;;
  FreeBSD)
    # commands for FreeBSD go here
  ;;
esac
