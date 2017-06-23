#!/bin/bash


# CRONTAB
# */5 * * * * ~/monitor.sh > /dev/null


file_name="log_`date +'%Y%m%d%H%M'`"

uptime_data=`uptime`
free_data=`free`
space_main=`df -h /`
space_home=`df -h /home`
users=`who`
top_ten=`top -o +%CPU | head -17`
ports=`netstat -lnv`
user_file=`find ~/ -type f -print | ls -hlA | head 6`

touch ./$file_name

echo $uptime_data >> $file_name
echo `` >> $file_name
echo $free_data >> $file_name
echo `` >> $file_name
echo $space_main >> $file_name
echo `` >> $file_name
echo $space_home >> $file_name
echo `` >> $file_name
echo $users >> $file_name
echo `` >> $file_name
echo $top_ten >> $file_name
echo `` >> $file_name
echo $ports >> $file_name
echo `` >> $file_name
echo $user_file >> $file_name
