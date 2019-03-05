#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Load the ICC profile
/usr/bin/xcalib -d :0 /usr/share/color/icc/N140HCA_EAB_01.icm
# Load Xresources
xrdb -merge $HOME/.Xresources
# Start the autolocker
xss-lock -- "$HOME/bin/lockscreen" &
# Load the media keys config
xbindkeys
# Load the sensitivity settings for the TrackPoint
xinput --set-prop 11 'libinput Accel Speed' 0.8
# Load the wallpaper
sh ~/.fehbg
# Start mpd and mpdcron
[[ -z $(pgrep -xU $UUID mpdcron) ]] && mpdcron &
mpd
# Start Bitlbee
bitlbee -F -u $USER

sh $HOME/bin/enable_docking.sh

# Start the programs
dunst &
unclutter &
# sxhkd &
# polybar example &
sh $HOME/bin/launch_polybar.sh
exec bspwm
