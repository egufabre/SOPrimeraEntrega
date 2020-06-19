#!/usr/bin/env bash
#-------------------------- VARIABLES ------------------------------
FECHA=
HORA=
USUARIO=
F=4
CantidadErrores=1
#-------------------------------------------------------------------
clear
echo -e "==================== MODIFICAR GRUPO PRIMARIO DE USUARIO =================="
echo ""

while [ "$F" -eq 4 ]
do
read -p "Ingrese el nombre del Usuario a modificar:     "    NAME
UserName=$NAME
if grep -qwis $NAME /etc/passwd
then
        clear
        cut -d':' -f1 /etc/group | column -c 80
        read -p "Ingrese el nuevo grupo primario:   "  STDIN
        Group=$STDIN
        if sudo usermod -g "$Group" $UserName
        then
            echo "Cambio de grupo exitoso!"
            FECHA=$(date +'%A %d de %B de %Y')
            HORA=$(date +%T)
            USUARIO=$(whoami)
            echo "$USUARIO modifico el grupo primario del usuario $UserName el $FECHA a las $HORA hs" >> log.txt

            F=3
        else
            echo "Error cambiando de directorio :("
            CantidadErrores=$((CantidadErrores+1))
                if [ "$CantidadErrores" -eq 4 ]
                then
                clear
                echo -e "Ha superado la cantidad de intentos permitidos"
                sleep 2
                F=3
                fi
        fi
else
        echo -e "Nombre de usuario Incorrecto"
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
sleep 1
./MenuModUser.sh

