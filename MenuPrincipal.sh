#!/usr/bin/env bash
#

#-------------------------- VARIABLES ------------------------------


F=4
CantidadErrores=1
FECHA=$(date +'%A %d de %B de %Y')
HORA=$(date +%T)
USUARIO=$(whoami)





# -------------------------------------------------------------------------- #
       
echo "El usuario $USUARIO ingreso al Menu Principal el $FECHA a las $HORA hs" >> log.txt




	clear

        echo ""

        echo "  "

        echo -e "=============== Menu Principal ====================="

        echo ""

        echo -e "\t1) Gestionar Usuario"

        echo -e "\t2) Gestionar Grupo"

        echo -e "\tQ) Salir"

        echo ""

        echo -e "\t Digite una opcion: "

        read OPCION

        case "$OPCION" in

                        1)
                        
                        ./MenuUsuarios.sh
                                        ;;

                        2)
                        
                        ./MenuGrupo.sh
                                        ;;
			       
			q|Q) exit      ;;

                        *)

			echo -e "\t Opcion Incorrecta! "
			sleep 1
			./MenuPrincipal.sh
        esac
					
