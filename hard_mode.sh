#!/usr/bin/env bash

# Hard version: Go through each line of /var/log/message containing a certain keyword (can be error, but you can decide upon the output, the more the merrier)
# and on odd numbered lines add a new line in the output,on standard output, with the date formatted DD/MM/YYYY-H:M:S.


#deviced on keywords: error & warning
awk '/level=error|level=warning/ {print}' /var/log/messages > file
counter=1


while read -r line;do
    #assign from file value to date and time and change format
    #use for testing: awk '/level=error|level=warning/ {print $6}' /var/log/messages | sed -n 's/.*"\(.*\)T\(.*\)\..*/\1 \2/p'

    #separate date and time from text and assign to variables
    date=$(echo $line | awk '{print $6}' | sed -n 's/.*"\(.*\)T\(.*\)\..*/\1 /p')
    time=$(echo $line | awk '{print $6}' | sed -n 's/.*"\(.*\)T\(.*\)\..*/\2 /p')

    echo $line

    #change date format
    date=$(date -d $date +%d/%m/%Y) #OBS: throws a little error, but pulls its' pants in the end

    #print on odd lines
    if [ $((counter%2)) -ne 0 ];then
        echo "${date} - ${time}"
    fi

    #increment counter
    let "counter=counter+1"
done < file
