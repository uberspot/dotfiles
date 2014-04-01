[ ! "$UID" = "0" ] && archbey -c green
[  "$UID" = "0" ] && archbey

# Check for an interactive session
[ "$-" != "${-%i*}" ] || return

# shell opts: see bash(1)
shopt -s autocd checkwinsize cdspell cmdhist cdable_vars checkjobs dirspell dotglob extglob \
         histappend histverify nocaseglob no_empty_cmd_completion

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

# Load the shell dotfiles, and then some:
for file in {$HOME/.alias,$HOME/.funcs,$HOME/.bash_prompt,/usr/share/doc/pkgfile/command-not-found.bash}; do
[ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

FILE="$HOME/.dircolors" ; [ -f $FILE ] && eval $(dircolors -b $FILE)
