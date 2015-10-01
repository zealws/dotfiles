#!/usr/bin/env bash
#
xmodmap ~/.xmodmap.rc || exit 1
syndaemon -i 0.8 -k -d || exit 2
#xcape -e 'Control_L=Escape' || exit 3

exec cinnamon-session
#exec papyros-session

#xsetroot -cursor_name left_ptr
#feh --bg-scale ~/.xmonad/facebook.jpeg
#
#exec xmonad

