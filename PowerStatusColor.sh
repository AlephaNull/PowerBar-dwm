# PowerStatus-dwm
# Author - HashTag-4512
# Date - 19/5/21
# A modular powerline statusbar for dwm

#powerline symbols
powerline_h="\ue0b2"  #
powerline_s="\ue0b3"  #

#colors
color1="\x03"
color2="\x04"
color3="\x05"
color4="\x06"
color5="\x07"

#main functions
datetime(){
  date_time="$(date '+%d-%m-%Y  %H:%M')" #date and time in dd-mm-yyy HH:MM format
  printf "%s%s" "$(echo -e $color2 $powerline_h)" "$(echo -e $color3 $date_time)"
}

#update every 30 seconds
while true; do
	xsetroot -name "$(datetime)"
	sleep 30
done




