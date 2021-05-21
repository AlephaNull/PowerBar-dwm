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
  date_time="$(date '+%d-%m-%Y   %H:%M:%S')" #date and time in dd-mm-yyy HH:MM format
  printf "%s%s" "$(echo -e $color2 $powerline_h)" "$(echo -e $color3 "" $date_time)"
}

sound(){
  vol="$(amixer get Master | sed -n 's/^.*\[\([0-9]\+\)%.*$/\1/p'| uniq)"
  printf "%s%s" "$(echo -e $color1 $powerline_h)" "$(echo -e $color4 "" $vol'% ')"
}

battery(){
  batc="$(cat  /sys/class/power_supply/BAT0/capacity)"   # contains a value from 0 to 100
  bats="$(cat /sys/class/power_supply/BAT0/status)"     # either "Charging" or "Discharging" 
  printf "%s%s %s" "$(echo -e $color2 $powerline_h)" "$(echo -e $color3 "" $batc'%')" "$(echo -e $color3 $bats)"
}

memory(){
  ram="$(free -t | awk 'FNR == 2 {print ""$3/$2*100}')"
  printf "%s%s" "$(echo -e $color1 $powerline_h)" "$(echo -e $color4 "" $ram'% ')"
}

process(){
  cpu="$(ps -eo pcpu | awk 'BEGIN {sum=0.0f} {sum+=$1} END {print sum}')"
  printf "%s%s" "$(echo -e $color5 $powerline_h)" "$(echo -e $color3 "" $cpu'%')"
}

#update every 30 seconds
while true; do
  xsetroot -name "$(process) $(memory) $(battery) $(sound) $(datetime)"
	sleep 5
done




