#!/bin/sh

# start some nice programs

if [ -d "$xinitdir"/xinitrc.d ] ; then
	for f in "$xinitdir/xinitrc.d"/?*.sh ; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

setxkbmap -model abnt2 -layout br
xsetroot -cursor_name left_ptr
exec bspwm
