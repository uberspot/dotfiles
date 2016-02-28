# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$HOME/.extra/zsh_custom


# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="code"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Increase the zsh limit of "do you wish to list all NNN possibilities?"
LISTMAX=500

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd.mm.yyyy"

export HISTCONTROL="erasedups:ignoreboth"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(sudo adb archlinux command-not-found git-extras dircycle colored-man iwhois systemd rsync zsh-syntax-highlighting-filetypes nmap git-extra-commands)

file="$ZSH/oh-my-zsh.sh"; [ -f "$file" ] && source "$file"

# Completion

# Make zsh know about hosts already accessed by SSH
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS} 
zstyle ':completion::complete:*' use-cache on

# cd will never select the parent directory (e.g.: cd ../<TAB>):
zstyle ':completion:*:cd:*' ignore-parents parent pwd

# formatting and messages
zstyle ':completion:*' verbose yes
zstyle ':completion:*:matches' group yes
zstyle ':completion:*:options' description yes
zstyle ':completion:*:descriptions' format $'\e[01;33m -- %d --\e[0m'
zstyle ':completion:*:messages' format $'\e[01;35m -- %d --\e[0m'
zstyle ':completion:*:warnings' format $'\e[01;31m -- No Matches Found --\e[0m'
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:options' auto-description '%d'

## add colors to processes for kill completion
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

# command completion: highlight matching part of command
zstyle -e ':completion:*:-command-:*:commands' list-colors 'reply=( '\''=(#b)('\''$words[CURRENT]'\''|)*-- #(*)=0=38;5;45=38;5;136'\'' '\''=(#b)('\''$words[CURRENT]'\''|)*=0=38;5;45'\'' )'

# activate menu selection
zstyle ':completion:*' menu select

# activate approximate completion, but only after regular completion (_complete)
zstyle ':completion:::::' completer _complete _approximate
# limit to 2 errors
zstyle ':completion:*:approximate:*' max-errors 2

# User configuration

file="/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"; [ -f "$file" ] && source "$file"

# check zshoptions to see what these do
setopt notify nohashdirs autocd globdots hist_ignore_all_dups noclobber auto_menu \
        pathdirs cdablevars checkjobs dotglob  histverify histappend autolist listtypes \
        prompt_subst rmstarsilent complete_in_word nohup

# Make cd act like pushd instead, letting us use popd to go back
setopt autopushd pushd_ignore_dups pushdtohome pushdminus pushdsilent
setopt inc_append_history # Add comamnds as they are typed, don't wait until shell exit

# no beep sound
setopt nolistbeep no_beep

unsetopt share_history # oh-my-zsh sets this, I don't want it.
unsetopt correct
unsetopt complete_aliases # expand aliases after tab completion finishes
unsetopt listambiguous

# get notified when someone logs in
watch=all                       # watch all logins
logcheck=30                     # every 30 seconds
WATCHFMT="%n from %M has %a tty%l at %T %W"

# Keybindings

# prepend sudo with ^S
insert-root-prefix() {
  BUFFER="sudo $BUFFER"
  CURSOR="$(($CURSOR + 5))"
}
zle -N insert-root-prefix
bindkey '^S' insert-root-prefix

# edit command in $EDITOR with ^E
autoload -U   edit-command-line
zle -N        edit-command-line
bindkey '^E' edit-command-line

# push current command to stack
bindkey '^U' push-line
# get last command from stack
bindkey '^Y' get-line

# run help on $0 command
bindkey '^K' run-help

# ls
inline-ls() {
    zle push-line
    BUFFER=" l"
    zle accept-line
}
zle -N inline-ls
bindkey '^F' inline-ls

file="$HOME/.shellrc"; [ -f "$file" ] && source "$file"

# display moo
moo

