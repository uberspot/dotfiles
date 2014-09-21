# Set defaults
export EDITOR="vim"
export BROWSER="firefox"
export PAGER="less"
export DE="openbox"

export HISTCONTROL=erasedups:ignorespace

export GREP_COLOR="1;34"
export GREP_OPTIONS='--color=auto -I'

export LESS="-FXRS"
export LESSHISTFILE="/tmp/.lesshst"

# Highlight section titles in manual pages
export LESS_TERMCAP_md="$ORANGE"

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"

export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

export GOPATH="$HOME/go"

export USE_CCACHE=1
export CCACHE_DIR=/tmp/ccache

# Prefer US English and use UTF-8
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

export TCL_LIBRARY=/usr/lib/tcl8.6

export JAVA_HOME=/usr/lib/jvm/default

export PATH="/usr/lib/ccache/bin/:$PATH:$HOME/.gem/ruby/2.1.0/bin:$HOME/adt_eclipse/sdk/platform-tools/"
