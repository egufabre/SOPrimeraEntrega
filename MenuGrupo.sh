#!/usr/bin/env bash

  echo ""

        echo -e "\t1) Ingresar nuevo grupo"

        echo -e "\t2) Modificar grupo"

        echo -e "\t3) Eliminar grupo"

        echo -e "\t4) Volver al menu principal"
	
	echo -e "\tQ) Salir"

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
		4)
			./MenuPrincipal.sh
			;;
		q|Q) exit
			;;
		*)echo -e "Opcion incorrecta!"
			echo""
	esac





