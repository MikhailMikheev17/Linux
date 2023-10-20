#!/bin/bash
# Считываем владельцев файлов в директории + убираем повторения + делаем папки по одной для каждого 
dir=$(ls -l | tr -s ' ' '\t' | cut -f '3' | sort -u)
for i in $dir; do
    mkdir -p $i
done

#Теперь считываем владельцев и названия. Проходимся по ним циклом (нечётное - владелец, чётное - название)
#Если название - проверяем, что это файл, а не папка. Если файл - отправляем в директорию с именем хозяина:

dirfile=$(ls -l | tr -s ' ' '\t' | cut -f '3 9')
count=0
for i in $dirfile; do
    count=$((count+1))
        if (($count%2))
            then
                dir=$i
                echo $dir = $i zero
            else
                if [ -f ./$i ]
                    then
                        cp ./$i ./$dir/$i
                fi
        fi
done
