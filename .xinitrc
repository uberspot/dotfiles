#!/bin/bash
udiskie &
exec openbox-session 
#exec enlightenment_start 
syndaemon -t -k -i 2 -d &

setxkbmap -model evdev -layout "us,gr" -variant extended -option "grp_led:scroll,grp:alt_shift_toggle,eurosign:e,terminate:ctrl_alt_bksp" &

