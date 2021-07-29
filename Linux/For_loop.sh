#!/bin/bash/

# Variables
states=('Nebraska' 'California' 'Texas' 'Hawaii' 'Washington')
nums=$(echo {0..9})
ls_out=$(ls)
execs=$(find /home -type f -perm 777 2> /dev/null)

# Script
for state in ${states[0]};
do
	if [ $state == 'Hawaii' ];
	then
		echo "Hawaii is the best!"
	else
		echo "I'm not a fan of Hawaii."
	fi
done

# Number Loop - Bonus
for num in ${nums[@]}
do
	if [$num  = 3 ] || [ $num = 5 ] || [ $num = 7 ]
	then
		echo $num
	fi
done
# LS Out - Bonus
for x in ${lsout[@]};
do
	echo $x
done

# Exec Loop - Super Bonus
for exc in ${execs[@]};
do
	echo $exec
done
