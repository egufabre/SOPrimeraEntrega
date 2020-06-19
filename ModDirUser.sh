#!/bin/bash
#-------------------------- VARIABLES ------------------------------
F=4
CantidadErrores=1
#-------------------------------------------------------------------
clear
echo -e "==================== MODIFICAR DIRECTORIO DE USUARIO =================="
echo ""

while [ "$F" -eq 4 ]
do
read -p "Ingrese el nombre del Usuario a modificar:     "    NAME
UserName=$NAME
if grep -qwis $NAME /etc/passwd
then
	 read -p "Ingrese el nuevo directorio:   "  STDIN
        Directory=$STDIN
        if sudo usermod -d $Directory $UserName
        then 
            echo "Cambio de directorio exitoso!"
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