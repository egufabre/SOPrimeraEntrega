#!/bin/bash
#-------------------------- VARIABLES ------------------------------
F=0
CantidadErrores=1
#-------------------------------------------------------------------
clear
echo -e "==================== MENU MODIFICAR USUARIO =================="
echo ""

while [ $F -eq 0 ]
do 
    clear
    echo ¿Que modificaciones desea realizar? 
 echo ""   
 echo "         a. Comentar el usuario

        	b. Agregar al usuario a otros grupos (secundarios)

       		c. Cambiar el grupo primario 

        	d. Modificar direccion del directorio 

        	e. Crear un nuevo shell

        	f. Cambiar el nombre en el log-in

        	g. Cambiar ID del usuario

        	h. Seleccionar periodo de expiracion

        	i. Bloquear usuario

        	j. Desboquear usuario

        	k. Eliminar a un Usuario de un Grupo
    
       		v. Volver al Menu de Usuarios"


    read -p " " OPCION
    clear

    case $OPCION in
    a|A)
        ./ModComentario.sh
    ;;

    b|B)
        ./ModUserGroupS.sh
    ;;

    c|C)
        ./ModUserGroupP.sh
    ;;

    d|D)
        ./ModDirUser.sh
    ;;

    e|E)
        ./ModShellUser.sh
    ;;

    f|F)
        ./ModNombreLogin.sh
    ;; 

    g|G)
        ./ModIdUser.sh
    ;; 

    h|H)
        ./ModExpireUser.sh
    ;;

    i|I)
        ./ModBloquearUser.sh
    ;;

    j|J)
        ./ModDesbloquearUser.sh
    ;;

    v|V)
        F=3
    ;;
    
     *)
	echo -e "Opcion Incorrecta"
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
done
./MenuUsuarios.sh
