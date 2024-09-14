#!/bin/bash
#Обозначения цветов: (1 - white, 2 - red, 3 - green, 4 - blue, 5 – purple, 6 - black)
#Параметр 1 - это фон названий значений (HOSTNAME, TIMEZONE, USER и т.д.)
#Параметр 3 - это фон значений (после знака '=')
whitef='\033[107m'
redf='\033[41m'
greenf='\033[42m'
bluef='\033[44m'	
purplef='\033[45m'	
blackf='\033[40m'
default='\033[0m'

#Параметр 2 - это цвет шрифта названий значений (HOSTNAME, TIMEZONE, USER и т.д.) 
#Параметр 4 - это цвет шрифта значений (после знака '=')
white='\033[97m'
red='\033[31m'	
green='\033[32m'
blue='\033[34m'	
purple='\033[35m'	
black='\033[30m'		
default='\033[0m'	

#Условие для цветов фона и штрифта
case $1 in 
1) pfn=$whitef ;;

2) pfn=$redf ;;

3) pfn=$greenf ;;

4) pfn=$bluef ;;

5) pfn=$purplef ;;

6) pfn=$blackf ;;

esac


case $2 in 
1) pcn=$white ;;

2) pcn=$red ;;

3) pcn=$green ;;

4) pcn=$blue ;;

5) pcn=$purple ;;

6) pcn=$black ;;

esac


case $3 in 
1) pfs=$whitef ;;

2) pfs=$redf ;;

3) pfs=$greenf ;;

4) pfs=$bluef ;;

5) pfs=$purplef ;;

6) pfs=$blackf ;;

esac


case $4 in 
1) pcs=$white ;;

2) pcs=$red ;;

3) pcs=$green ;;

4) pcs=$blue ;;

5) pcs=$purple ;;

6) pcs=$black ;;

esac