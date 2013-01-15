#!/bin/bash
# wget -qO- https://github.com/danclaudiupop/dotfiles/raw/master/install.sh | /bin/bash

if [ -d ~/.dotfiles ]; then
    cd ~/.dotfiles
    git pull
else
    git clone https://github.com/danclaudiupop/dotfiles.git ~/.dotfiles/
    git clone https://github.com/gmarik/vundle.git ~/.dotfiles/.vim/bundle/vundle
    for cf in ~/.dotfiles/configs/*; do
        ln -s "$cf" ~/.$(basename "$cf")
    done

    vim +BundleInstall +qall
fi