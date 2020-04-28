#!/bin/bash

I=0

while [ $I -eq 0 ]
do
    clear
    echo "
        Bienvenido al menu principal
    "
    sleep 2

    echo "
            Menu
            1. A;adir usuario 
            2. A;adir grupo
            3. Modificar usuario
            4. Eliminar usuario
            0. Salir
    "
    read -p "   " OPCION
    
    clear
    
    case $OPCION in
        1)
            AddUser.sh
        ;;
        2)
            AddGroup.sh
        ;;
        3)
            ModUser.sh
        ;;
        4)
            DelUser.sh
        ;;
        0)
            I=1
        ;;
        *)
            echo Opcion Incorrecta!
        ;;
    esac
done
