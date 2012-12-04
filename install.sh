#!/bin/bash

# This script creates symlinks in ~/ to all files in ~/.dotfiles.

olddir=~/.dotfiles_old

# backup old files
echo "backing up old files into $olddir"
mkdir -p $olddir
echo "..done"

# assume we are in the dotfiles-repo
for file in $(git ls-files); do
    mv ~/$file $olddir
    ln -s $(pwd)/$file ~/$file
done
