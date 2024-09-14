#!/bin/bash
#Написать bash-скрипт. Скрипт запускается с одним параметром.
#Параметр - это абсолютный или относительный путь до какой-либо директории. Параметр должен заканчиваться знаком '/', например: script05.sh /var/log/
#Скрипт должен выводить следующую информацию о каталоге, указанном в параметре:
#- Общее число папок, включая вложенные
#- Топ 5 папок с самым большим весом в порядке убывания (путь и размер)
#- Общее число файлов
#- Число конфигурационных файлов (с расширением .conf), текстовых файлов, исполняемых файлов, логов (файлов с расширением .log), архивов, символических ссылок
#- Топ 10 файлов с самым большим весом в порядке убывания (путь, размер и тип)
#- Топ 10 исполняемых файлов с самым большим весом в порядке убывания (путь, размер и хеш)
#- Время выполнения скрипта

source time.sh

#Условия 
if [[ $# > 1 || $# < 1 ]]
then	
echo "Скрипт запускается с 1 параметром,попробуйте повторно вызвать скрипт"
exit
fi

if [[ $1 =~ [/]$ ]]
then 
echo "Total number of folders (including all nested ones) = "  `find /var/log/ -type d | wc -l `
echo "TOP 5 folders of maximum size arranged in descending order (path and size): " 
echo "`find /var/log/ -type d -exec du -Sh {} +| sort -rh| head -5| cat -n| awk '{print $1" - "$3 "/, "$2}'| tr -d "."`"
echo "etc up to 5"
echo "Total number of files =" `find /var/log/ -type f | wc -l`
echo "Number of:" 
echo "Configuration files (with the .conf extension) = " `find /var/log/ -type f -name "*.conf" | wc -l`
echo "Text files = " `find /var/log/ -type f -name "*.txt" | wc -l`
echo "Executable files = "`find /var/log/ -type f -name "*.exe" | wc -l`
echo "Log files (with the extension .log) = " `find /var/log/ -type f -name "*.log" | wc -l`
echo "Archive files = " `find /var/log/ -type f -name "*.rar" -or -name "*.gz" -or -name "*.tar" -or -name "*.zip" -or -name "*.7z"| wc -l`
echo "Symbolic links = " `find /var/log/ -type l | wc -l`
echo "TOP 10 files of maximum size arranged in descending order (path, size and type): "
echo "`find /var/log/ -type f -exec du -Sh {} +| sort -rh | head -10 | cat -n |awk '{print $1" - "$3 ", " $2", "}'`"
echo "etc up to 10"
echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file)  " 
echo "`find /var/log/ -type f -name "*.exe" -exec du -Sh {} + |md5sum| sort -rh | head -10 | cat -n |awk '{print $1" - "$3 ", " $2}'`"
echo "etc up to 10"
echo "Script execution time (in seconds) = "`echo "$end $start"| awk '{printf "%.1f", $1-$2}'` 

else 
echo "Параметр должен заканчиваться знаком '/'"
exit
fi


