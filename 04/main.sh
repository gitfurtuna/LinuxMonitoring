#!/bin/bash
#Конфигурирование визуального оформления вывода для скрипта исследования системы
#Написать bash-скрипт. За основу берется скрипт из Part 3.
# Обозначения цветов аналогичные.

source color.sh 

#Цвет для текстовой расшифровки
whiteT="1 (white)"
redT="2 (red)"
greenT="3 (green)"	
blueT="4 (blue)"	
purpleT="5 (purple)"	
blackT="6 (black)"		

#Цвет по умолчанию для текстовой расшифровки
whiteTD="default (white)"
redTD="default (red)"	
greenTD="default (green)"
blueTD="default (blue)"
purpleTD="default (purple)"
blackTD="default (black)"	


#Цвета по умолчанию
co1backD=6
co1fontD=3
co2backD=4
co2fontD=2 


#Вывод
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


#Считывание информации из файла конфигурации
co1back=`cat file.config | grep column1_background= | sed 's/1/first/1' | tr -d "columnfirst_background="`
co1font=`cat file.config | grep column1_font_color= | sed 's/1/first/1' | tr -d "columnfirst_font_color="`
co2back=`cat file.config | grep column2_background= | sed 's/2/second/1'| tr -d "columnsecond_background="`
co2font=`cat file.config | grep column2_font_color= | sed 's/2/second/1'| tr -d "columnsecond_font_color="`


#Условие для цветов фона и штрифта
case $co1back in 

1) pfn=$whitef && dfn=$whiteT ;;

2) pfn=$redf && dfn=$redT ;;

3) pfn=$greenf && dfn=$greenT ;;

4) pfn=$bluef && dfn=$blueT ;;

5) pfn=$purplef && dfn=$purpleT ;;

6) pfn=$blackf && dfn=$blackT ;;

esac


case $co1font in 

1) pcn=$white && dcn=$whiteT ;;

2) pcn=$red && dcn=$redT ;;

3) pcn=$green && dcn=$greenT ;;

4) pcn=$blue && dcn=$blueT ;;

5) pcn=$purple && dcn=$purpleT ;;

6) pcn=$black && dcn=$blackT ;;

esac


case $co2back in 

1) pfs=$whitef && dfs=$whiteT ;;

2) pfs=$redf && dfs=$redT ;;

3) pfs=$greenf && dfs=$greenT ;;

4) pfs=$bluef && dfs=$blueT ;;

5) pfs=$purplef && dfs=$purpleT ;;

6) pfs=$blackf && dfs=$blackT ;;

esac


case $co2font in 

1) pcs=$white && dcs=$whiteT ;;

2) pcs=$red && dcs=$redT ;;

3) pcs=$green && dcs=$greenT ;;

4) pcs=$blue && dcs=$blueT ;;

5) pcs=$purple && dcs=$purpleT ;;

6) pcs=$black && dcs=$blackT ;;

esac

#Условие для цветов фона и штрифта по умолчанию
case $co1backD in 

1) pfnD=$whitef && dfnD=$whiteTD ;;

2) pfnD=$redf && dfnD=$redTD ;;

3) pfnD=$greenf && dfnD=$greenTD ;;

4) pfnD=$bluef && dfnD=$blueTD ;;

5) pfnD=$purplef && dfnD=$purpleTD ;;

6) pfnD=$blackf && dfnD=$blackTD ;;

esac

case $co1fontD in 

1) pcnD=$white && dcnD=$whiteTD ;;

2) pcnD=$red && dcnD=$redTD ;;

3) pcnD=$green && dcnD=$greenTD ;;

4) pcnD=$blue && dcnD=$blueTD ;;

5) pcnD=$purple && dcnD=$purpleTD ;;

6) pcnD=$black && dcnD=$blackTD ;;

esac

case $co2backD in 

1) pfsD=$whitef && dfsD=$whiteTD ;;

2) pfsD=$redf && dfsD=$redTD ;;

3) pfsD=$greenf && dfsD=$greenTD ;;

4) pfsD=$bluef && dfsD=$blueTD ;;

5) pfsD=$purplef && dfsD=$purpleTD ;;

6) pfsD=$blackf && dfsD=$blackTD ;;

esac


case $co2fontD in 

1) pcsD=$white && dcsD=$whiteTD ;;

2) pcsD=$red && dcsD=$redTD ;;

3) pcsD=$green && dcsD=$greenTD ;;

4) pcsD=$blue && dcsD=$blueTD ;;

5) pcsD=$purple && dcsD=$purpleTD ;;

6) pcsD=$black && dcsD=$blackTD ;;

esac 


#Условия

if [[ $# > 0 ]]
then	
echo "Скрипт запускается без параметров,попробуйте повторно вызвать скрипт"
exit
fi

if [[ $# < 1 && $co1back == [123456] && $co1font == [123456] && $co2back == [123456] && $co2font == [123456] && $co1back != $co1font && $co2back != $co2font ]]
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
echo
echo "Column 1 background = $dfn "
echo "Column 1 font color = $dcn "
echo "Column 2 background = $dfs "
echo "Column 2 font color = $dcs "
else

if [[ $co1back == "" ]]
then 
let co1back=$co1backD && pfn=$pfnD && dfn=$dfnD
fi

if [[ $co1font == "" ]]
then
let  co1font=$co1fontD && pcn=$pcnD && dcn=$dcnD
fi 

if [[ $co2back == "" ]]
then
let  co2back=$co2backD && pfs=$pfsD && dfs=$dfsD
fi

if [[ $co2font == "" ]]
then
let  co2font=$co2fontD && pcs=$pcsD && dcs=$dcsD
fi

if [[ $# < 1 && $co1back == [123456] && $co1font == [123456] && $co2back == [123456] && $co2font == [123456] && $co1back != $co1font && $co2back != $co2font ]]
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
echo
echo "Column 1 background = $dfn "
echo "Column 1 font color = $dcn "
echo "Column 2 background = $dfs "
echo "Column 2 font color = $dcs "
fi

if [[ $# < 1 && $co1back != [123456] || $co1font != [123456] || $co2back != [123456] || $co2font != [123456] ]] && [[ $co1back == $co1font || $co2back == $co2font ]]
then
echo "Цвета шрифта и фона одного столбца не должны совпадать и параметры должны быть числовые от 1 до 6"
elif [[ $# < 1 && $co1back == [123456] && $co1font == [123456] && $co2back == [123456] && $co2font == [123456] && $co1back == $co1font || $co2back == $co2font ]]
then
echo "Цвета шрифта и фона одного столбца не должны совпадать, попробуйте повторно вызвать скрипт"
elif [[ $# < 1 && $co1back != [123456] || $co1font != [123456] || $co2back != [123456] || $co2font != [123456] && $co1back != $co1font && $co2back != $co2font ]]
then
echo "Параметры должны быть числовые от 1 до 6"
fi
fi
