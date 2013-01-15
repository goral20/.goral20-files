#!/bin/sh
setxkbmap pl
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

#~/.setbg
#~/.fehbg              # set wallpaper
#unclutter -root &       # hide cursor when unused

# hide cursor
unclutter -noevents -idle 5 &

# Turn Super/Windows key into XF86Launch1
xmodmap -e "keycode 133 = XF86Launch1"

# Turn CapsLock into Control
xmodmap -e "clear lock" -e "keycode 66 = Control_R" -e "add Control = Control_R"

conky | while read -r; do xsetroot -name "$REPLY"; done &

#while true; do
#   xsetroot -name "$(date +"%F %R")"
#	    sleep 1m    # Update time every minute
#			done &

#while :; do
#    feh --bg-fill "$(find "/home/sebastian/Obrazy/# Wybrane Tapety pod system #/nge_zmienne_tapety/" -type f | shuf -n1)"
#		sleep 1m
#done &

# Launch system-wide stuff first, then dwm...
exec /usr/bin/urxvt &
exec mpd &
exec mpdscribble &
exec conky -c /home/sebastian/.conkyrc2 &
exec conky -c /home/sebastian/.conkyrc3 &
urxvt -title ncmpcpp -e ncmpcpp &
urxvt -title shell-ekg2 -e tmux -S tmuxses attach &
#urxvt -class mutt -e mutt &
sh ~/.zmienne_tapety.sh &
#feh --bg-fill "/home/sebastian/Obrazy/# Wybrane Tapety pod system #/AKTUALNA TAPETA.png"
#exec ck-launch-sesion dbus-launch dwm
exec dwm
