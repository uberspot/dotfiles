[ ! "$UID" = "0" ] && archbey -c green
[  "$UID" = "0" ] && archbey

export PS1="\[\e[1;32m\]\u@\h:\w\$ \[\e[0m\]"

# Check for an interactive session
[ "$-" != "${-%i*}" ] || return

# shell opts: see bash(1)
shopt -s cdspell dirspell extglob histverify no_empty_cmd_completion checkwinsize cmdhist histappend nocaseglob

# notify of completed background jobs immediately
set -o notify 
# disable core dumps
ulimit -S -c 0 

eval $(dircolors -b)

# make less more friendly for non-text input files
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


# bash-completion
bind 'set completion-ignore-case On'
bind 'TAB:menu-complete'
bind 'set mark-symlinked-directories on'

FILE="$HOME/.alias" ; [ -f $FILE ] && . $FILE
FILE="$HOME/.funcs" ; [ -f $FILE ] && . $FILE

FILE="$HOME/.dircolors" ; [ -f $FILE ] && eval $(dircolors -b $FILE)
