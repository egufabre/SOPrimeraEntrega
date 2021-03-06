#!/usr/bin/env bash

#-------------------------- VARIABLES ------------------------------


F=4
NombreGrupo=
CantidadErrores=1

clear
echo -e "==================== ELIMINAR GRUPO =================="
echo ""

while [ "$F" -eq 4 ]
do
        echo -e "Ingrese el nombre del grupo que desea eliminar"
        read NombreGrupo
if grep -qwis $NombreGrupo /etc/group
then

        sudo groupdel $NombreGrupo

        clear
        echo -e""
        echo -e "El nombre del grupo fue eliminado exitosamente"
        sleep 2
        F=3
else
       	echo "El grupo $NombreGrupo no existe"
        CantidadErrores=$((CantidadErrores+1))
        if [ "$CantidadErrores" -eq 4 ]
        then
                clear
                echo -e "Ha superado la cantidad de intentos permitidos"
                sleep 2
                F=3
        fi
fi

done
./MenuGrupo.sh
