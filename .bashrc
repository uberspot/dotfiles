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

# from https://github.com/mrzool/bash-sensible/blob/master/sensible.bash
# Prevent file overwrite on stdout redirection
# Use `>|` to force redirection to an existing file
set -o noclobber

# Automatically trim long paths in the prompt (requires Bash 4.x)
PROMPT_DIRTRIM=2

# Enable history expansion with space
# E.g. typing !!<space> will replace the !! with your last command
bind Space:magic-space

# Perform file completion in a case insensitive fashion
bind "set completion-ignore-case on"

# Treat hyphens and underscores as equivalent
bind "set completion-map-case on"

# Display matches for ambiguous patterns at first tab press
bind "set show-all-if-ambiguous on"

# Record each line as it gets issued
PROMPT_COMMAND='history -a'



[  "$UID" = "0" ] \
    && export PS1="\[${BOLD}${BLUE}\]\H\[$WHITE\]:\[$YELLOW\] \w \[$WHITE\]\[$RED\]ϟ \[$WHITE\]\[$RESET\]"

moo
