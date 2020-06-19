#!/bin/bash

#-------------------------- VARIABLES ------------------------------

F=4
CantidadErrores=1
#-------------------------------------------------------------------
clear
echo -e ""
echo "$(tput setaf 1)Puede detener el proceso en cualquier momento apretando Ctrl+C, excepto al ingresar una contraseña $(tput sgr 0)"
sleep 2
clear
echo -e "==================== CREAR NUEVO USUARIO =================="
echo -e ""
while [ "$F" -eq 4 ]
do
read -p "Por favor ingrese el nombre del nuevo usuario:      "   NAME
UserName=$NAME
if grep -qwis $UserName /etc/passwd
then
    echo El usuario $UserName ya existe en el servidor
	CantidadErrores=$((CantidadErrores+1))
	if [ "$CantidadErrores" -eq 4 ]
	then
		clear
		echo -e "Ha superado la cantidad de intentos permitidos"
		sleep 2
		F=3				
	fi
else    
    echo
    read -p "Desea agregarlo a un grupo existente? Y / N :     "  OPCION
    case $OPCION in
    Y|y) 
        cut -d':' -f1 /etc/group | column -c 80
        echo
        read -p "Ingrese el nombre del grupo_:" NAME
        Group=$NAME

        if grep -qwis $Group /etc/group
        then
            echo
            read -p "Seguro desea agregar el usuario $UserName al grupo $Group? Y / N :     " OPCION
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
		./MenuUsuarios.sh
            ;;

            *)
                echo Opcion Incorrecta
		CantidadErrores=$((CantidadErrores+1))
		if [ "$CantidadErrores" -eq 4 ]
		then
		clear
		echo -e "Ha superado la cantidad de intentos permitidos"
		sleep 2
		F=3				
	fi
            ;;
            esac

        else
            echo -e "El Grupo ingresado no existe"
	    echo -e "Para crearlo debe ingresar al Menu de Grupo"
	    sleep 1
	    F=3
        fi
    ;;

    N|n)
        echo Agregando Usuario sin grupo
        sudo useradd -d /home/$UserName -m -s /bin/bash $UserName
        if sudo passwd -q $UserName
        then
            echo Usuario creado con exito!
        else
            echo Error al asignar password
        fi
    ;;

    *)
        echo Opcion Incorrecta
	CantidadErrores=$((CantidadErrores+1))
	if [ "$CantidadErrores" -eq 4 ]
	then
		clear
		echo -e "Ha superado la cantidad de intentos permitidos"
		sleep 2
		F=3				
	fi
    ;;
    esac
fi
done
./MenuUsuarios.sh
               