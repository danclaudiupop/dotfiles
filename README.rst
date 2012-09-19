Install
-------


To install or update run::

  wget -qO- https://github.com/danclaudiupop/dotfiles/raw/master/install.sh | /bin/bash

To launch tmux by default add the following lines in bashrc::

  if [[ "$TERM" != "screen-256color" ]]
    then
      tmux -2 attach-session -t "$USER" || tmux -2 new-session -s "$USER" 
      exit
  fi

Now to break down what exactly the above lines do:

- if [ $TERM != "screen-256color" ] && [ $TERM != "screen" ];, this checks the $TERM environment variable to see if tmux is already running. This is to avoid an infinite loop of launching tmux.
- tmux attach || tmux new; exit, this launches tmux and attaches to a running session or creates a new one.
- exit, this closes the shell running underneath tmux when the last tmux window is closed.
