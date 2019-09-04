awk -F, '{print $1 " " $12 " " substr($19,24,length($19)-25) " " substr($21,24,length($21)-25)}'
