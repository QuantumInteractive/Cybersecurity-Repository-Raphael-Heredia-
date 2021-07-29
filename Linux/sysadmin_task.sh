#!/bin/bash/

#Define Packages list
packages=(
	'nano'
	'wget'
	'net-tools'
)

# Loop Through the list of packages
for package in $[packages[0]};
do
	if [ $(which $packages) ]
	then
		echo "package is installed at $(which $packages)."
	else
		echo "package is not installed."
	fi
done

# Search each user's home directory for scripts
for user in $(ls /home);
do
	for item in $(find /home/$user -iname '*.sh');
	do
		echo -e "Found q script in $user's home folder! \n$item"
	done
done

# Loop through the scripts in my scripts folder and chage permiisions to execute
for script in $(ls $HOME/sysadmin/Security_Scripts);
do 
	if [ ! -x $HOME/sysadmin/Security_Scripts/$script ]
	then
		chmod +x $HOME/sysadmin/Security_Scripts/$script
	fl
done

# Loop through a list of filesand creat a hash of each file 
for file in $(ls ~/Documents/custom_scripts);
do
	sha256sum $file
done
