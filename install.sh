#!/bin/sh
# Clones necessary dependencies and creates symlinks.
# This is very basic cause I don't replicate the confs that often and it serves mostly as a personal note.

git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
chsh -s /bin/zsh

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "Do vim -> plugininstall and ' cd ~/.vim/bundle/YouCompleteMe && ./install.sh && cd - '"
echo "Do ' pacman -S zsh-syntax-highlighting '"

echo "Creating symlinks"
for file in $(find ./* -type f -name \* -print | egrep -v "^(./.gitignore|./.git/)" | sed 's/.\///' ); do ln -isv ~/.dotfiles/$file ~/$file; done

