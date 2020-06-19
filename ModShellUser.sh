#!/bin/bash
#-------------------------- VARIABLES ------------------------------
FECHA=
HORA=
USUARIO=
F=4
CantidadErrores=1
#-------------------------------------------------------------------
clear
echo -e "==================== CAMBIAR SHELL DE USUARIO =================="
echo ""

while [ "$F" -eq 4 ]
do
read -p "Ingrese el nombre del Usuario a modificar:     "    NAME
UserName=$NAME
if grep -qwis $NAME /etc/passwd
then
	read -p "Ingrese el nuevo shell /bin/<nuevo>:   "  STDIN
        Shell=$STDIN
        if sudo usermod -s /bin/$Shell $UserName
        then 
            echo "Cambio de directorio exitoso!"
		
	    FECHA=$(date +'%A %d de %B de %Y')
       	    HORA=$(date +%T)
            USUARIO=$(whoami)
	    echo "$USUARIO cambio el shell del usuario $UserName el $FECHA a las $HORA hs" >> log.txt

	    F=3
        else
            echo "Error cambiando shell :("
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
	
