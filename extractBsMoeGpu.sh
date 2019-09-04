awk '{split($0,nocsv,".");split(nocsv[1],res,"_");print substr(res[1],3,length(res[1])-2) " " substr(res[2],4,length(res[2])-3) " " substr(res[3],4,length(res[3])-3)}'
