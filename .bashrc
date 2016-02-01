# Check for an interactive session
[ "$-" != "${-%i*}" ] || return

file="$HOME/.shellrc"; [ -f "$file" ] && source "$file"

# shell opts: see bash(1)
shopt -s autocd checkwinsize cdspell cmdhist cdable_vars checkjobs dirspell dotglob extglob \
        histappend histverify nocaseglob no_empty_cmd_completion

# notify of completed background jobs immediately
set -o notify
# disable core dumps
ulimit -S -c 0

# bash-completion
bind 'set completion-ignore-case On'
bind 'TAB:menu-complete'
bind 'set mark-symlinked-directories on'

try_source "$HOME/.bash_prompt"

[  "$UID" = "0" ] \
    && export PS1="\[${BOLD}${BLUE}\]\H\[$WHITE\]:\[$YELLOW\] \w \[$WHITE\]\[$RED\]ϟ \[$WHITE\]\[$RESET\]"

moo
