#!/bin/bash
#Визуальное оформление вывода для скрипта исследования системы

source color.sh

#Написать bash-скрипт. За основу взять скрипт из Part 2 
HOSTNAME=`hostname`
TIMEZONE=`timedatectl | grep "Time zone" | awk '{print $3,"UTC",$5}'| tr -d "0(),"`
USER=`whoami`
OS=`cat /etc/issue | awk '{print $1,$2,$3}'| tr -d '\r\n'`
DATE=`date | awk '{print $2,$3,$4,$5}'`
UPTIME=`uptime -p`
UPTIME_SEC=`cat /proc/uptime | awk '{print $1}'`
IP=`hostname -I | awk '{print $1}'`
MASK=`ifconfig | grep "netmask" | awk 'NR==1{print $4}'`
GATEWAY=`ip route | grep "default" | awk '{print $3}'`
RAM_TOTAL=`free -m | grep "Mem" | awk '{printf "%.3f GB" , $2/1024}'`
RAM_USED=`free -m | grep "Mem" | awk '{printf "%.3f GB" , $3/1024}'`
RAM_FREE=`free -m | grep "Mem" | awk '{printf "%.3f GB" , $4/1024}'`
SPACE_ROOT=`df -Th /root | grep "/" | awk '{printf "%.2f MB" , $3 * 1024}'`
SPACE_ROOT_USED=`df -Th /root | grep "/" | awk '{printf "%.2f MB" , $4 * 1024}'`
SPACE_ROOT_FREE=`df -Th /root | grep "/" | awk '{printf "%.2f MB" , $5 * 1024}'`

#Условия
if [[ $1 == [123456] && $2 == [123456] && $3 == [123456] && $4 == [123456] && $# < 5 && $1 != $2 && $3 != $4 ]] ;
then
echo -e "$pfn$pcn HOSTNAME$default=$pfs$pcs$HOSTNAME$default"
echo -e "$pfn$pcn TIMEZONE$default=$pfs$pcs$TIMEZONE$default"
echo -e "$pfn$pcn USER$default=$pfs$pcs$USER$default"
echo -e "$pfn$pcn OS$default=$pfs$pcs$OS$default"
echo -e "$pfn$pcn DATE$default=$pfs$pcs$DATE$default"
echo -e "$pfn$pcn UPTIME$default=$pfs$pcs$UPTIME$default"
echo -e "$pfn$pcn UPTIME_SEC$default=$pfs$pcs$UPTIME_SEC$default"
echo -e "$pfn$pcn IP$default=$pfs$pcs$IP$default"
echo -e "$pfn$pcn MASK$default=$pfs$pcs$MASK$default"
echo -e "$pfn$pcn GATEWAY$default=$pfs$pcs$GATEWAY$default"
echo -e "$pfn$pcn RAM_TOTAL$default=$pfs$pcs$RAM_TOTAL$default"
echo -e "$pfn$pcn RAM_USED$default=$pfs$pcs$RAM_USED$default"
echo -e "$pfn$pcn RAM_FREE$default=$pfs$pcs$RAM_FREE$default"
echo -e "$pfn$pcn SPACE_ROOT$default=$pfs$pcs$SPACE_ROOT$default"
echo -e "$pfn$pcn SPACE_ROOT_USED$default=$pfs$pcs$SPACE_ROOT_USED$default"
echo -e "$pfn$pcn SPACE_ROOT_FREE$default=$pfs$pcs$SPACE_ROOT_FREE$default"
elif [[ $1 != [123456] || $2 != [123456] || $3 != [123456] || $4 != [123456] || $# > 4 && $1 != $2 && $3 != $4 ]] ;
then
echo "Скрипт запускается с 4 параметрами.Параметры числовые от 1 до 6"
elif [[ $1 == [123456] && $2 == [123456] && $3 == [123456] && $4 == [123456] && $# < 5 && $1 == $2 || $3 == $4 ]] ;
then
echo "Цвета шрифта и фона одного столбца не должны совпадать, попробуйте повторно вызвать скрипт"
fi

