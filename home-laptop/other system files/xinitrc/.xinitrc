#!/bin/sh
setxkbmap pl
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap
xbindkeys

# hide cursor
unclutter -noevents -idle 5 &

# Turn Super/Windows key into XF86Launch1
xmodmap -e "keycode 133 = XF86Launch1"

# Turn CapsLock into Control
xmodmap -e "clear lock" -e "keycode 66 = Control_R" -e "add Control = Control_R"

conky | while read -r; do xsetroot -name "$REPLY"; done &

# Launch system-wide stuff first, then dwm...
exec /usr/bin/urxvt &
exec mpd &
exec mpdscribble &
exec conky -c /home/sebastian/.conkyrc2 &
exec conky -c /home/sebastian/.conkyrc3 &
urxvt -title ncmpcpp -e ncmpcpp &
urxvt -title shell-ekg2 -e tmux -S tmuxses attach &
urxvt -class mutt -e irssi &
urxvt -class mutt -e mutt &
urxvt -class newsbeuter -e newsbeuter &
sh ~/.zmienne_tapety.sh &
udiskie &
exec dwm
