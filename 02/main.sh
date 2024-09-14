#!/bin/bash
#Исследование системы
#Название файла должно иметь вид: DD_MM_YY_HH_MM_SS.status 
#(Время в имени файла должно указывать момент сохранения данных).
date=`date '+%d_%m_%Y_%H_%M_%S'`

#Написать bash-скрипт. Скрипт должен вывести на экран информацию в виде:
echo "HOSTNAME =" `hostname`
echo "TIMEZONE =" `timedatectl | grep "Time zone" | awk '{print $3,"UTC",$5}'| tr -d "0(),"`
echo "USER =" `whoami`
echo "OS = " `cat /etc/issue | awk '{print $1,$2,$3}'| tr -d '\r\n'`
echo "DATE =" `date | awk '{print $2,$3,$4,$5}'`
echo "UPTIME =" `uptime -p`
echo "UPTIME_SEC =" `cat /proc/uptime | awk '{print $1}'`
echo "IP =" `hostname -I | awk '{print $1}'`
echo "MASK =" `ifconfig | grep "netmask" | awk 'NR==1{print $4}'`
echo "GATEWAY =" `ip route | grep "default" | awk '{print $3}'`
echo "RAM_TOTAL =" `free -m | grep "Mem" | awk '{printf "%.3f GB" , $2/1024}'`
echo "RAM_USED =" `free -m | grep "Mem" | awk '{printf "%.3f GB" , $3/1024}'`
echo "RAM_FREE =" `free -m | grep "Mem" | awk '{printf "%.3f GB" , $4/1024}'`
echo "SPACE_ROOT =" `df -Th /root | grep "/" | awk '{printf "%.2f MB" , $3 * 1024}'`
echo "SPACE_ROOT_USED =" `df -Th /root | grep "/" | awk '{printf "%.2f MB" , $4 * 1024}'`
echo "SPACE_ROOT_FREE =" `df -Th /root | grep "/" | awk '{printf "%.2f MB" , $5 * 1024}'`

source answer.sh
