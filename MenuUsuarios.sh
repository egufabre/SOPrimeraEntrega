#!/bin/bash

#-------------------------- VARIABLES ------------------------------


CantidadErrores=1
I=0

# -------------------------------------------------------------------------- #



    clear
    echo "
        Bienvenido al menu de Usuarios
    "
    sleep 1

    clear
    echo -e "=============== Menu Gestion de Usuario ====================="

        echo ""
    echo "
            Menu
         
	    1) Añadir 
         
	    2) Modificar
         
	    3) Eliminar
	 
	    v) Volver al menu anterior
    "
    read -p "   " OPCION
    
    
    case $OPCION in
        1)
            ./AddUser.sh
        ;;
        2)
            ./MenuModUser.sh
        ;;
        3)
            ./DelUser.sh
        ;;
        v|V)
           ./MenuPrincipal.sh
        ;;
        *)
	echo -e "\t Opcion inválida! "
	sleep 1
	 ./MenuUsuarios.sh
	;;
    esac
