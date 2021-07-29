#!/bin/bash

name='Ralph'
echo "hello $name"
echo -e "\nThis is my script.\n"
echo -e "The files in $PWD are: \n$(ls)"
cp /etc/passwd $PWD
echo -e "The files in $PWD are now: \n$(ls)"
echo " "
echo "have a great day"
