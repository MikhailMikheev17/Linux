#cat > delfiletodir

#!/bin/bash

read -p "Введите путь к дирректории: " DELDIR

if [ -e $DELDIR ]
        then
                echo 'Указанная дирректория найдена!'
                cd $DELDIR
                echo 'Удаление'
                rm -v *.bak *.tmp *.backup
                echo 'Удаление успешно завершено!'
        else
                echo 'Указанная дирректория не найдена!Ошибка!'
                exit 2
fi

#bash delfiletodir