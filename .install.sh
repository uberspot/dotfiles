#!/bin/sh
# Clones necessary dependencies and creates symlinks.
# This is very basic cause I don't replicate the confs that often and it serves mostly as a personal note.

echo "Creating symlinks"
for file in $(find ./* -maxdepth 0 -name ".[^.]*" -print | egrep -v "^(./.gitignore|./.git|./.mozilla)" | sed 's/.\///' );
do ln -isv ~/.dotfiles/$file ~/$file; done

sudo pacman -S zsh-syntax-highlighting zsh htop cowsay fortune-mod vim terminator git ncdu fdupes atool inxi xclip colordiff mtr youtube-dl screen imagemagick zsh-completions
apacman -S trash-cli the_silver_searcher

chsh -s /bin/zsh

zsh -c "vim +PluginInstall +qall;"

# link neovim
mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
ln -s ~/.vim $XDG_CONFIG_HOME/nvim
ln -s ~/.vimrc $XDG_CONFIG_HOME/nvim/init.vim

