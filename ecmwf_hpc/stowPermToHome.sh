#!/bin/sh
ln -s $PERM/dotfiles/ecmwf_hpc/.bashrc $HOME/.bashrc || true
ln -s $PERM/dotfiles/ecmwf_hpc/.profile $HOME/.profile || true
ln -s $PERM/.fzf $HOME/.fzf || true
ln -s $PERM/.fzf.bash $HOME/.fzf.bash || true

mkdir -p $HOME/.config/zellij
mkdir -p $HOME/.local/bin

ln -s $PERM/dotfiles/zellij/.config-n1/zellij/config.yaml $HOME/.config/zellij/config.yaml || true

FROM="$PERM/dotfiles/zellij/.local/bin"
TO="$HOME/.local/bin"
for f in $FROM/*
do
    t=$TO/$(basename -- $f)
    echo "Link $f -> $t"
    ln -s $f $t || true
done


FROM="$PERM/dotfiles/kak/.local/bin"
TO="$HOME/.local/bin"
for f in $FROM/*
do
    t=$TO/$(basename -- $f)
    echo "Link $f -> $t"
    ln -s $f $t || true
done

FROM="$PERM/dotfiles/kak/.config"
TO="$HOME/.config"
for f in $FROM/*
do
    t=$TO/$(basename -- $f)
    echo "Link $f -> $t"
    ln -s $f $t || true
done


