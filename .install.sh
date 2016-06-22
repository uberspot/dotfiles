#!/bin/sh
# Installs repo and necessary dependencies.
# This is very basic cause I don't replicate the confs that often and it serves mostly as a personal note.
# The dotfiles management was inspired by https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/

DOT_DIR=$HOME/.dotfiles

git clone --bare https://github.com/uberspot/dotfiles.git $DOT_DIR
alias dotfiles='git --git-dir=$DOT_DIR/ --work-tree=$HOME'
mkdir -p $HOME/.dotfiles-backup

# if checkout fails try to move any pre-existing configs to backup dir
dotfiles checkout
[[ $? -ne 0 ]] && dotfiles checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .dotfiles-backup/
# checkout again to make sure everything is there
dotfiles checkout
# initialize submodules
dotfiles submodule update --init --recursive

# install dependencies
sudo pacman -S zsh-syntax-highlighting zsh htop cowsay fortune-mod vim terminator git ncdu fdupes atool inxi xclip colordiff mtr youtube-dl screen imagemagick zsh-completions
apacman -S trash-cli the_silver_searcher git-extras ls++-git

# set default shell to zsh
chsh -s /bin/zsh

chmod +x ~/.extra/z/z.sh

# install vim plugins based on .vimrc
zsh -c "vim +PlugInstall +qall;"

# link neovim config files
mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
ln -s $HOME/.vim $XDG_CONFIG_HOME/nvim
ln -s $HOME/.vimrc $XDG_CONFIG_HOME/nvim/init.vim

