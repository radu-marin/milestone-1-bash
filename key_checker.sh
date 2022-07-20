#!/usr/bin/env bash
#set -x

# Checks authorized_keys file from .ssh file. If any weird new key pops out signals an alert in our log.

# generate and select fingerprints:
check=$(ssh-keygen -lf /root/.ssh/authorized_keys | awk '{print $2}')

echo "$check" | \
while read -r line;do
        # the following file (nice_fingerprints.txt) is stashed in a hidded folder and contains the fingerprints of known authorized ssh keys
        if cat /root/Documents/.finger_much/nice_fingerprints.txt | grep $line;then
                #uncomment next line for testing
                #echo "All is fine"
                :               # pass command
        else
                # will output as crontab message and also record in warnings.txt file.
                date
                echo "WARNING: unknown key added"
                echo Unknown key: $line
                date >> /root/Documents/.finger_much/warnings.txt
                echo "WARNING: unknown key added: $line" >> /root/Documents/.finger_much/warnings.txt
        fi
done

# start crontab and run every 4 hrs:
crontab -l > crontab_copy  #first make copy of current jobs
#change following path of current file if needed:
echo "0 */4 * * * /home/milestone_1/key_checker.sh" >> crontab_copy  
crontab crontab_copy  #use crontab_copy as new input for crontab
rm crontab_copy #remove crontab_copy artefact from .

#OBS: don't forget to make this script executable and clean crontab if necessary.