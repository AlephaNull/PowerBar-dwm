# PowerStatus-dwm
# Author - HashTag-4512
# Date - 19/5/21
# A modular powerline statusbar for dwm

#powerline symbols
powerline_h="\ue0b2"  #
powerline_s="\ue0b3"  #


#main functions
datetime(){
  date_time="$(date '+%d-%m-%Y   %H:%M')" #date and time in dd-mm-yyy HH:MM format
  printf "%s%s" "$(echo -e $powerline_s)" "$(echo -e " " $date_time)"
}

sound(){
  vol="$(amixer get Master | sed -n 's/^.*\[\([0-9]\+\)%.*$/\1/p'| uniq)"
  printf "%s%s" "$(echo -e $powerline_s)" "$(echo -e " " $vol'% ')"
}

battery(){
  batc="$(cat  /sys/class/power_supply/BAT0/capacity)"   # contains a value from 0 to 100
  bats="$(cat /sys/class/power_supply/BAT0/status)"     # either "Charging" or "Discharging" 
  printf "%s%s %s" "$(echo -e $powerline_s)" "$(echo -e " " $batc'%')" "$(echo -e $bats)"
}

memory(){
  ram="$(free -t | awk 'FNR == 2 {print ""$3/$2*100}')"
  printf "%s%s" "$(echo -e $powerline_s)" "$(echo -e " " $ram'% ')"
}

process(){
  cpu="$(ps -eo pcpu | awk 'BEGIN {sum=0.0f} {sum+=$1} END {print sum}')"
  printf "%s%s" "$(echo -e $powerline_s)" "$(echo -e " " $cpu'%')"
}

#update every 30 seconds
while true; do
  xsetroot -name "$(process) $(memory) $(battery) $(sound) $(datetime)"
	sleep 30
done




