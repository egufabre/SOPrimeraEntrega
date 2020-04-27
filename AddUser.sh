#!/bin/bash

clear
echo "$(tput setaf 1)Puede detener el proceso en cualquier momento apretando Ctrl+C, excepto al ingresar una contraseña $(tput sgr 0)"

read -p "Por favor ingrese el nombre del nuevo usuario:_      "   NAME
UserName=$NAME

if grep -qwis $UserName /etc/passwd
then
    echo El usuario $UserName ya existe en el servidor

else    
    echo
    read -p "Desea agregarlo a un grupo existente? Esto puede realizarse luego Y/n_:     "  OPCION
    case $OPCION in
    Y|y) 
        echo
        read -p "Ingrese el nombre del grupo_:" NAME
        Group=$NAME

        if grep -qwis $Group /etc/group
        then
            echo
            read -p "Seguro desea agregar el usuario $UserName al grupo $Group? Y/n_:     " OPCION
            case $OPCION in
            Y|y)
                echo Creando y agregando usuario...
                sudo useradd -d /home/$UserName -m -s /bin/bash -g $Group $UserName
                if sudo passwd -q $UserName
                then
                    echo Usuario Creado Exitosamente!
                else   
                    echo Error al asignar contraseña
                fi
            ;;

            N|n)
                echo Volviendo al menu...
            ;;

            *)
                echo Opcion Incorrecta
            ;;
            esac

        else
            echo
            AddGroup.sh
            read -p "Desea crear el grupo $Group ahora? Y/n_:     "     OPCION
            case $OPCION in
            Y|y)
                sudo groupadd $Group 
                echo Grupo creado con exito!
                sleep 1
                echo Ingresando al usuario $UserName en el grupo $Group
                sudo useradd -d /home/$UserName -m -s /bin/bash -g $Group $UserName
                if sudo passwd -q $UserName
                then
                    echo Usuario Creado Exitosamente!
                else   
                    echo Error al asignar contraseña
                fi
            ;;

            N|n)
                break;
            ;;

            *)
                echo Opcion Incorrecta
            ;;
            esac
        fi
    ;;

    N|n)
        echo Agregando Usuario
        sudo useradd -d /home/$UserName -m -s /bin/bash $UserName
        if sudo passwd -q $UserName
        then
            echo Usuario creado con exito!
        else
            echo Error al asignar contrase;a
        fi
    ;;

    *)
        echo Opcion Incorrecta
    ;;
    esac
fi

               