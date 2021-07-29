#!/bin/bash
mkdir -p /var/backup
tar cvzf /var/backup/home.tar.gz /home
mv /var/backup/home.tar.gz /var/backup/home.01012021.tar.gz
tar cvzf /var/backup/home.tar.gz /home
ls -lh /var/backup > /var/backup/file_report.txt
free -h > /var/backup/fisk_report.txt
