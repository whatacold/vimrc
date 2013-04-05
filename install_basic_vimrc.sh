#!/bin/sh

if [ ! -e ~/.vim_runtime ]; then
    ln -s `pwd` ~/.vim_runtime
fi
cd ~/.vim_runtime

cat ~/.vim_runtime/vimrcs/basic.vim > ~/.vimrc
echo "Installed the Basic Vim configuration successfully! Enjoy :-)"

