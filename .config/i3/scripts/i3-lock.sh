#!/bin/bash

# change to a :locked: workspace
i3-msg workspace "locked"

# take a screenshot
scrot /tmp/screen_locked.png


# add blur
#convert /tmp/screen_locked.png -blur 2x2 /tmp/screen_locked2.png

# or

# make black and white
convert -type Grayscale -blur 0x1 /tmp/screen_locked.png /tmp/screen_locked2.png


# lock the screen using the produced picture
i3lock -f -t -i /tmp/screen_locked2.png

# return to last used workspace
i3-msg workspace back_and_forth
