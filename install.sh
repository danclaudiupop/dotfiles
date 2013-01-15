#!/bin/bash
function link_file {
    source="${PWD}/$1"
    target="${HOME}/$1"

    if [ -e "${target}" ]; then
        mv $target $target.bak
    fi

    ln -sf ${source} ${target}
}

if [ -d ~/.dotfiles ]; then
    cd ~/.dotfiles/.vim/bundle/vundle/
    git pull origin master
    cd ~/.dotfiles
    git pull origin master

    sudo pip install pip --upgrade
    sudo pip install flake8 --upgrade
    vim -u ~/.dotfiles/.vimrc - +BundleInstall! +BundleClean! +qall
else
    git clone https://github.com/danclaudiupop/dotfiles.git ~/.dotfiles
    git clone https://github.com/gmarik/vundle.git ~/.dotfiles/.vim/bundle/vundle
    cd ~/.dotfiles

    for f in .vim .vimrc .tmux.conf .gitconfig .battery
    do
        link_file $f
    done

    sudo apt-get -y install python-pip
    sudo pip install pip --upgrade
    sudo pip install flake8 --upgrade
    vim -u ~/.dotfiles/.vimrc - +BundleInstall +qall
fi
