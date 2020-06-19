#!/bin/bash

FECHA=
HORA=
USUARIO=



clear
echo -e "==================== ELIMINAR USUARIO =================="


echo -e ""
read -p "Ingrese el nombre del Usuario a borrar:    "    USER
UserName=$USER

if sudo userdel -rf $UserName
then
    echo Usuario Eliminado con exito!
	FECHA=$(date +'%A %d de %B de %Y')
	HORA=$(date +%T)
	USUARIO=$(whoami)
	echo "$USUARIO elimino al usuario $UserName el $FECHA a las $HORA hs" >> log.txt
else
    echo El usuario no existe 
fi
sleep 2
./MenuUsuarios.sh
