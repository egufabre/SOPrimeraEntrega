#!/bin/bash

clear
read -p "Ingrese el nombre del Usuario a borrar:_    "    USER
UserName=$USER

if sudo userdel -rf $UserName
then
    echo Usuario Eliminado con exito!
else
    echo El usuario no existe 
fi
