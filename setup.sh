#!/bin/bash

# Clone this into your home directory, then symlink like this:
# (You'll  need to move your dotfiles out the way first).

for file in $(ls); do
    ln -fs $(pwd)/$file ~/.$file;
done
