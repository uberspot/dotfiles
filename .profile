# Set defaults
export EDITOR="vim"
export BROWSER="firefox"
export PAGER="less"
export DE="openbox"

export HISTCONTROL=erasedups:ignorespace

export GREP_COLOR="1;34"
export GREP_OPTIONS='--color=auto -I'

export LESS="-FXRS"
# disable ~/.lesshst (potential data leakage)
export LESSHISTFILE="/dev/null"

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

export PATH="$HOME/.extra/bin/:/usr/lib/ccache/bin/:/usr/bin:/usr/local/bin:/bin:/usr/local/sbin:/opt/android-sdk/tools:/usr/lib/jvm/default/bin:/ usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:$HOME/.gem/ruby/2.2.0/bin:$HOME/android/platform-tools/"

[  "$UID" = "0" ] && export PATH="$PATH:/root/scripts"

# source env variables from android sdk and ndk
source /etc/profile.d/android-sdk.sh
source /etc/profile.d/android-ndk.sh

if [ -e /usr/share/terminfo/x/xterm-256color ]; then
    export TERM='xterm-256color'
else
    export TERM='xterm-color'
fi

# define the prefered visual terminal
export VTERM=x-terminal-emulator

# Firefox
export MOZ_GLX_IGNORE_BLACKLIST=1
export MOZ_USE_OMTC=1
export MOZILLA_X11_XINITTHREADS=1
export MOX_X_THREADSAFE=1
export MOZ_ACCELERATED=1
export MOZ_DISABLE_CRASHREPORTER=1
export MOZ_DISABLE_PANGO=1

#[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
#[[ "$(tty)" == "/dev/tty1" ]] && [[ $- == *i* ]] && exec startx

