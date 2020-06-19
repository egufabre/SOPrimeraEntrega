#!/bin/bash

clear
echo -e "==================== ELIMINAR USUARIO =================="


echo -e ""
read -p "Ingrese el nombre del Usuario a borrar:    "    USER
UserName=$USER

if sudo userdel -rf $UserName
then
    echo Usuario Eliminado con exito!
else
    echo El usuario no existe 
fi
sleep 2
./MenuUsuarios.sh
