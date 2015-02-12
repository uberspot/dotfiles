#!/bin/sh
# Clones necessary dependencies and creates symlinks.
# This is very basic cause I don't replicate the confs that often and it serves mostly as a personal note.

git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
chsh -s /bin/zsh

echo "Creating symlinks"
for file in $(find ./* -type f -name \* -print | egrep -v "^(./.gitignore|./.git/)" | sed 's/.\///' ); 
do ln -isv ~/.dotfiles/$file ~/$file; done

sudo pacman -S zsh-syntax-highlighting zsh-completions
packer -S fasd

zsh -c "vundle-update; ~/.vim/bundle/YouCompleteMe/install.sh"

