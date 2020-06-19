#!/usr/bin/env bash

#-------------------------- VARIABLES ------------------------------
FECHA=
HORA=
USUARIO=
F=4
NombreGrupo=
CantidadErrores=1

clear
echo -e "==================== CREAR NUEVO GRUPO =================="
echo ""

while [ "$F" -eq 4 ]
do
	echo -e "Ingrese el nombre del grupo que desea crear"
	read NombreGrupo
if  grep -qwis $NombreGrupo /etc/group
then
	echo "El grupo $NombreGrupo ya existe"
	CantidadErrores=$((CantidadErrores+1))
	if [ "$CantidadErrores" -eq 4 ]
	then
		clear
		echo -e "Ha superado la cantidad de intentos permitidos"
		sleep 2
		F=3				
	fi


else

	sudo groupadd  $NombreGrupo

	clear
	echo -e""
	echo -e "Grupo $NombreGrupo creado exitosamente"
	FECHA=$(date +'%A %d de %B de %Y')
	HORA=$(date +%T)
	USUARIO=$(whoami)



	echo "El usuario $USUARIO creo el grupo $NombreGrupo el $FECHA a las $HORA hs" >> log.txt

	sleep 2
	F=3
	fi
done
./MenuGrupo.sh


