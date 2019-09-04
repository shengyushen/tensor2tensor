awk '{arr[$3][$4]=arr[$3][$4]+$2} END{for(x in arr) {for(y in arr[x]){print x " "y " " arr[x][y]}}}'
