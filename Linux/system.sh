#!/bin/bash

# Output CPU Usage information

touch ~/backup/freemem/free_mem.txt
	ls -l df -h > ~/backup/freemem/free_mem.txt

touch ~/backup/diskuse/disk_usage.txt
	ls -l du > ~/backup/diskuse/disk_usage.txt

touch ~/backup/openlist/open_list.txt
	ls -l lsof | wc -1 > ~backup/openlist/open_list.txt

touch ~/backup/freedisk/free_disk.txt
	ls -l df -h > ~/backup/freedisk/free_disk.txt
