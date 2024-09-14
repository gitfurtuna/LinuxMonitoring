#!/bin/bash


#После вывода значений предложить записать данные в файл (предложить пользователю ответить Y/N)
read -p "Do you want to save this information:Y/N " sun
if [[ $sun = Y || $sun = y ]];
then 
touch $date.status
echo "HOSTNAME =" `hostname`>>$date.status
echo "TIMEZONE =" `timedatectl | grep "Time zone" | awk '{print $3,"UTC",$5}'| tr -d "0(),"`>>$date.status
echo "USER =" `whoami`>>$date.status
echo "OS = " `cat /etc/issue | awk '{print $1,$2,$3}'`>>$date.status
echo "DATE =" `date | awk '{print $2,$3,$4,$5}'`>>$date.status
echo "UPTIME =" `uptime -p`>>$date.status
echo "UPTIME_SEC =" `cat /proc/uptime | awk '{print $1}'`>>$date.status
echo "IP =" `hostname -I | awk '{print $1}'`>>$date.status
echo "MASK =" `ifconfig | grep "netmask" | awk 'NR==1{print $4}'`>>$date.status
echo "GATEWAY =" `ip route | grep "default" | awk '{print $3}'`>>$date.status
echo "RAM_TOTAL =" `free -m | grep "Mem" | awk '{printf "%.3f GB" , $2/1024}'`>>$date.status
echo "RAM_USED =" `free -m | grep "Mem" | awk '{printf "%.3f GB" , $3/1024}'`>>$date.status
echo "RAM_FREE =" `free -m | grep "Mem" | awk '{printf "%.3f GB" , $4/1024}'`>>$date.status
echo "SPACE_ROOT =" `df -Th /root | grep "/" | awk '{printf "%.2f MB" , $3 * 1024}'`>>$date.status
echo "SPACE_ROOT_USED =" `df -Th /root | grep "/" | awk '{printf "%.2f MB" , $4 * 1024}'`>>$date.status
echo "SPACE_ROOT_FREE =" `df -Th /root | grep "/" | awk '{printf "%.2f MB" , $5 * 1024}'`>>$date.status
else exit
fi


