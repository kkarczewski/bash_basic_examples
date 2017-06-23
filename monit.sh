#!/bin/bash
## Script for easy system monitoring
## Author: Bartosz Majek
## Requestor: Marcin Iwaniuk
## Creation date: 2017/05/03
## Version: 1.0F

## Recommended execution frequency: every 5 min
## Add to CRON:
## */5 * * * * /path/to/script/monit.sh

#========================== VAR section ============================#
# Filename
file_prefix="status"
file_date=`date +"%Y%m%d%H%M"`
filename="$file_prefix"_"$file_date"

# Top snapshot
top_d=`top -b -n 1 | head -17`
top_data=`echo "$top_d" | head -1`

# Top details
uptime_data=`echo $top_data | awk -F "," '{print $1}' | cut -b 19- | sed 's;,;;g'`
users_data=`echo $top_data | awk -F "," '{print $2}' | cut -c 2- | sed 's;,;;g'`
loadavg_data=`echo $top_data | awk -F "," '{print $3 $4 $5}' | cut -c 2- | sed 's;,;;g'`

# RAM and Disk
free_ram=`free -m | sed -n 2p | awk '{print $4}'`
disk_mount_gen="/"
disk_mount_home=`df -m | sed -n 2p | awk '{print $6}'`
free_disk_gen=`df -m | awk '$6 == "'"$disk_mount_gen"'" {print $4}'`
free_disk_home=`df -m | awk '$6 == "'"$disk_mount_home"'" {print $4}'`

# Top 10 CPU
list_top_cpu=`echo "$top_d" | sed -n 7,17p`

# Listen ports
list_open_ports=`netstat -tulpn | awk 'NR >= 3 {print $4}'`

# List users and home directories
list_userh=`cat /etc/passwd | awk -F ":" '{print $1 " " $6}'`
list_user=`echo "$list_userh" | awk '{print $1}'`
list_hdir=`echo "$list_userh" | awk '{print $2}'`
declare -a alist_user=($list_user)
declare -a alist_hdir=($list_hdir)

# Set start values for loop
i=0
j=0

## Function for send data to file
function save {
                echo "$1" >> $filename
              }  

#========================== RUN section ============================#

# Create file
touch $filename

# Put main info from top
save "Uptime: $uptime_data"
save "Logged Users: $users_data"
save "$loadavg_data"
save "-----------------------"
save "Free RAM: $free_ram MB"
save "Free disk space for $disk_mount_gen : $free_disk_gen MB"
save "Free disk space for home dir mount point $disk_mount_home : $free_disk_home MB"
save "-----------------------"
save "List TOP 10 Processes by CPU usage:"
save "$list_top_cpu"
save "-----------------------"
save "List Listen ports:"
save "$list_open_ports"
save "-----------------------"
save "Lits TOP 5 biggest files for users:"
# Loop
for i in "${alist_hdir[@]}"
do
	save ">User: ${alist_user["$j"]}"
	save " Home dir: $i"
	save "`ls -lSh $i | sed -n 2,6p`"
	save ""
	j=$j+1
done
