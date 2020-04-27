#!/bin/bash
clear

read -p "Ingrese el nombre del Usuario a modificar_:     "    NAME
UserName=$NAME

I=0
while [ $I -eq 0 ]
do 
    echo Que modificaciones desea hacer? 
    echo "a. Comentar el usuario
        b. Agregar al usuario a otros grupos (secundarios)
        c. Cambiar el grupo primario 
        d. Modificar direccion del directorio 
        e. Crear un nuevo shell
        f. Cambiar el nombre en el log-in
        g. Cambiar ID del usuario
        h. Seleccionar periodo de expiracion
        i. Bloquear usuario
        j. Desboquear usuario
        ---------------------------------------------------------
        0. Terminar modificaciones"
    read -p " " OPCION
    clear

    case $OPCION in
    a|A)
        read -p "Ingrese el comentario:  "   STDIN 
        Comment=$STDIN
        if sudo usermod -c "$Comment" $UserName
        then
            echo Modificacion exitosa!
        else
            echo Error agregando el comentario :(
        fi
    ;;

    b|B)
        read -p "Ingrese el/los nombre/s de/los grupo/s secundario/s:   "  STDIN
        SecondaryGroup=$STDIN
        if sudo usermod -a -G "$SecondaryGroup" $UserName
        then 
            echo Usuario agregado exitosamente1
        else
            echo Error al agregar al usuario :(
    ;;

    c|C)
        read -p "Ingrese el nuevo grupo primario:   "  STDIN
        Group=$STDIN
        if sudo usermod -g $Group $UserName
        then 
            echo Cambio de directorio exitoso!
        else
            echo Error cambiando de directorio :(
        fi
    ;;

    d|D)
        read -p "Ingrese el nuevo directorio:   "  STDIN
        Directory=$STDIN
        if sudo usermod -d "$Directory" $UserName
        then 
            echo Cambio de directorio exitoso!
        else
            echo Error cambiando de directorio :(
        fi
    ;;

    e|E)
        read -p "Ingrese el nuevo shell /bin/<nuevo>:   "  STDIN
        Shell=$STDIN
        if sudo usermod -s /bin/"$Directory" $UserName
        then 
            echo Cambio de directorio exitoso!
        else
            echo Error cambiando de directorio :(
        fi
    ;;

    f|F)
        read -p "Ingrese el nuevo nombre para Log-in:   "  STDIN
        Login=$STDIN
        if sudo usermod -l $Login $UserName
        then 
            echo Cambio de nombre exitoso!
        else
            echo Error cambiando de nombre :(
        fi
    ;; 

    g|G)
        read -p "Ingrese el nuevo ID:   "  STDIN
        ID=$STDIN
        if sudo usermod -u "$ID" $UserName
        then 
            echo Cambio de directorio exitoso!
        else
            echo Error cambiando de directorio :(
        fi
    ;; 

    h|H)
        read -p "Ingrese el nuevo directorio:   "  STDIN
        Directory=$STDIN
        if sudo usermod -d "$Directory" $UserName
        then 
            echo Cambio de directorio exitoso!
        else
            echo Error cambiando de directorio :(
        fi
    ;;

    i|I)
        read -p "Seguro desea bloquear al usuario $UserName ?  Y/n "  OPCION
        case $OPCION in
        Y|y)
            if sudo usermod -L $UserName
            then
                echo Usuario bloqueado con exito!
            else    
                echo Error al bloquear al usuario :(
            fi
        ;;
        N|n)
            break;
        ;;
        *)
            echo Opcion incorrecta
        ;;
        esac
    ;;

    i|I)
        read -p "Seguro desea desbloquear al usuario $UserName ?  Y/n "  OPCION
        case $OPCION in
        Y|y)
            if sudo usermod -U $UserName
            then
                echo Usuario desbloqueado con exito!
            else    
                echo Error al desbloquear al usuario :(
            fi
        ;;
        N|n)
            break;
        ;;
        *)
            echo Opcion incorrecta
        ;;
        esac
    ;;

    
            



