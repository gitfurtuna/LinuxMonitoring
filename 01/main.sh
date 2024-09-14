#!/bin/bash
#Проба пера/Скрипт запускается с одним параметром. Параметр текстовый.
#Скрипт выводит значение параметра.
#Если параметр - число, то должно выводится сообщение о некорректности ввода.
read -p "Please enter your parametr: " a
if [[ $a =~ ^[0-9]+$ ]]
then
echo "Your parametr is incorrect"
else
echo "You are $a "
fi
