#!/bin/bash
#-------------------------- VARIABLES ------------------------------
F=4
CantidadErrores=1
#-------------------------------------------------------------------
clear
echo -e "==================== ASIGNAR GRUPO SECUNDARIO A USUARIO =================="
echo ""

while [ "$F" -eq 4 ]
do
	read -p "Ingrese el nombre del Usuario a modificar:     "    NAME
	UserName=$NAME
	if grep -qwis $NAME /etc/passwd
	then

		cut -d':' -f1 /etc/group | column -c 80
        	read -p "Ingrese el/los nombre/s de/los grupo/s secundario/s:   "  STDIN
        	SecondaryGroup=$STDIN
       	 	if sudo usermod -a -G "$SecondaryGroup" $UserName
        	then 
            	echo "Usuario agregado exitosamente!"
		F=3
        	else
            	echo "Error al agregar al usuario :("
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