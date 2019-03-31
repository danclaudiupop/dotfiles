#!/bin/bash
function linkwork()
{
    linkTocheck="$1"
    sourceLink="$2"
    if [ -f "$linkTocheck" ]; then
        echo "$linkTocheck is a file - backing it up"
        mv "$linkTocheck" "$sourceLink.bak"  
    fi
    if [ ! -h "$linkTocheck" ]; then
        ln -s "$sourceLink" "$linkTocheck"
        echo "$linkTocheck created"
    fi
}

if [ "Linux" = "$(uname -a | awk '{printf $1}')" ]
then
    linkwork "/$(whoami)"/.tmux.conf /home/"$(whoami)"/.tmux.conf
    linkwork "/$(whoami)"/.config/nvim/init.vim /home/"$(whoami)"/.config/nvim/init.vim
fi


if [ "Mac" = "$(sw_vers|grep ProductName |awk '{printf $2}')" ]
then
    linkwork "/Users/$(whoami)/.tmux.conf" "$(pwd)"/.tmux.conf 
    linkwork "/Users/$(whoami)/.config/nvim/init.vim" "$(pwd)"/init.vim
fi
