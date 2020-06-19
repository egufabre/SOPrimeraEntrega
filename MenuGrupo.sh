#!/usr/bin/env bash

#-------------------------- VARIABLES ------------------------------


F=4
CantidadErrores=1


#-------------------------------------------------------------------

clear
echo -e "==================== MENU GESTION DE GRUPO =================="


echo ""

        echo -e "\t1) Ingresar nuevo grupo"

        echo -e "\t2) Modificar grupo"

        echo -e "\t3) Eliminar grupo"

        echo -e "\tV) Volver al menu principal"

	echo ""
	echo -e "Ingrese una opcion: "
	
	read OPCION

	case "$OPCION" in
		1)
			./AddGroup.sh
			;;
		2)
			./ModGroup.sh
			;;
		3)
			./DelGroup.sh
			;;
		v|V)
			./MenuPrincipal.sh
			;;
			
		*)	
			echo -e "Opcion incorrecta!"
			sleep 1
                	./MenuGrupo.sh
			;;
	esac
