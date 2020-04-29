#!/usr/bin/env bash
#
# -------------------------------------------------------------------------- #
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
                        
                        ./MenuUsuario.sh
                                        ;;

                        2)
                        
                        ./MenuGrupo.sh
                                        ;;
			       
			q|Q) exit      ;;

                        *) echo -e "${ROJO}\t Opcion inválida! "

                        echo ""

        esac
					
