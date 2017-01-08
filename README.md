#dotfiles

This repo is more of a collection of things that you might find useful rather than a generic solution for every user.

Install with

    cd $HOME
    wget https://raw.githubusercontent.com/uberspot/dotfiles/master/.install.sh -O temp_install.sh
    chmod +x temp_install.sh
    ./temp_install.sh
    rm temp_install.sh

GTK and Icons theme: Vertex

If you wanna know the dependencies check [.gitmodules](.gitmodules) and [.install.sh](.install.sh) (arch linux specific)

##Features

 - zsh/bashrc key bindings, better autocompletion, ls coloring and generally improved behavior in the shell (check [.zshrc](.zshrc), [.bashrc](.bashrc), [.inputrc](.inputrc), [.shellrc](.shellrc) ).
 - pretty theme for zsh (check [.extra/zsh_custom/themes/code.zsh-theme](.extra/zsh_custom/themes/code.zsh-theme) ) and [.bash_prompt](.bash_prompt)) 
 - lots of useful aliases and functions (check [.alias](.alias), [.funcs](.funcs)).
 - keybindings and better functionality in vim/neovim (check [.vimrc](.vimrc), [.vim/](.vim/)). Neovim uses the same config but it is symlinked in [.install.sh](.install.sh). 
 - some configs from /etc in [.etc/](.etc/)
 - really useful aliases and improved behavior for git [.gitconfig](.gitconfig). Add your own modifications and private
   username, email to [.gitconfig.user](.gitconfig.user). It is sourced by gitconfig automatically.
 - custom user.js file + smaller changes for firefox in [.mozilla/firefox/customchanges/](.mozilla/firefox/customchanges/). You can copy those files to your own firefox profile.
 - useful keybindings and custom actions for openbox, thunar, terminator and other apps in [.config/](.config/).

I've tried to add comments in those configs that explain most of the functionality.


###Quick screenshot of conky, tint, terminator and zsh theme

![conky](https://github.com/uberspot/dotfiles/blob/master/.extra/conky.png)
![vim](https://github.com/uberspot/dotfiles/blob/master/.extra/vim.png)
![terminal](https://github.com/uberspot/dotfiles/blob/master/.extra/terminal.png)

