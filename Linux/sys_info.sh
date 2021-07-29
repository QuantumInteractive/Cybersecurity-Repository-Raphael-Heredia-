#!/bin/bash

# Variables
output-$HOME/research/sys_info.txt
ip=$(ip addr | grep inet | tail -2 | head -1)
execs=$(find /home -type f -perm 777 2> /dev/null/)

#Script
if [ ! -d $HOME/research ]
then 
	mkdir $HOME/research 2> /dev/null
fi

if [ -f $output ]
then
	rm $output
fi

# Header info Display
echo "A Quick System Audit Script" > $output
date >> $output
echo "" >> $output

# Machine info Display
echo "Machine Type Info:" >> $output
echo $MACHTYPE >> $output
echo -e "Uname info: $(uname -a) \m" >> $output
echo -e "IP Info: $(ip addr | grep inet | tail -2 | head -1) \n" >> $output
echo "Hostname: S(hostname -s)" >> $output
echo "DNS Servers: " >> $output
cat /etc/resolv.conf >> $output

# Memory info Display
echo "\nMemory Info:" >> $output
free >> $output

# CPU info Display
echo -e "\nCPU Info:" >> $output
lscpu | grep CPU >> $output

# Disk info Display
echo -e "nDisk Usage:" >> $output
df -H | head -2 >> $output

# Logged in info (WHO IS) Display
echo -e "\nWho is logged in: \n $(whp) n\" >> $output
echo -e "\nexec Files:" >> $output
sudo find /home -type f -perm 777 >> $output

# TOP 10 Process Display
echo -e "\nTop 10 Processes" >> $output
ps aux --sort -%mem | awk {'print $1, $2, $3, $4, $11'} | head >> $output
echo -e "\nThe permissions for sensitive /etc/fiels: \n" >> $output
for file in ${files[@]};
do
	ls -l $file >> $output
done

# Display Check for Sudo Permissions
for user in $(ls /home);
do
	sudo -lU $user 2 >>  $output
done
