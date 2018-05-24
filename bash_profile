export SHELL="/usr/bin/fish"

PATH=~/.anaconda/bin:$PATH:~/opt/bin

[[ $TERM != "screen" ]] && exec tmux

export PATH="$HOME/.cargo/bin:$PATH"
