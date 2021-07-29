#!/bin/bash

months=(
	'january'
	'feburary'
	'march'
	'april'
	'may'
	'june'
	'july'
	'august'
	'september'
	'october'
	'november'
	'december'
)

days=('mon' 'tues' 'wed' 'thur' 'fri' 'sat' 'sun')


# Print out Months

for month in ${months[@]};
do
	echo $month
done

for day in ${days[@]};
do
	if [ $day = 'sun' ] || [ $day = 'sat' ]
	then
		echo "it is $day. take it easy."
	else
		echo "it is $day, Get to Work!"
	fi
done

for num in in {0..5};
do
	if [ $num = 1 ] || [ $num = 4 ]
	then
		echo $num
	fi
done
