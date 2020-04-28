#!/bin/bash
clear

read -p "Ingrese el nombre del Usuario a modificar_:     "    NAME
UserName=$NAME

I=0
while [ $I -eq 0 ]
do 
    clear
    echo Que modificaciones desea hacer? 
    echo "      a. Comentar el usuario
        b. Agregar al usuario a otros grupos (secundarios)
        c. Cambiar el grupo primario 
        d. Modificar direccion del directorio 
        e. Crear un nuevo shell
        f. Cambiar el nombre en el log-in
        g. Cambiar ID del usuario
        h. Seleccionar periodo de expiracion
        i. Bloquear usuario
        j. Desboquear usuario
        k. Eliminar a un Usuario de un Grupo
        ---------------------------------------------------------
        0. Terminar modificaciones"
    read -p " " OPCION
    clear

    case $OPCION in
    a|A)
        clear
        read -p "Ingrese el comentario:  "   STDIN 
        Comment=$STDIN
        if sudo usermod -c "$Comment" $UserName
        then
            echo "Modificacion exitosa!"
        else
            echo "Error agregando el comentario :("
        fi
    ;;

    b|B)
        clear
        cut -d':' -f1 /etc/group | column -c 80
        read -p "Ingrese el/los nombre/s de/los grupo/s secundario/s:   "  STDIN
        SecondaryGroup=$STDIN
        if sudo usermod -a -G "$SecondaryGroup" $UserName
        then 
            echo "Usuario agregado exitosamente!"
        else
            echo "Error al agregar al usuario :("
        fi
    ;;

    c|C)
        clear
        cut -d':' -f1 /etc/group | column -c 80
        read -p "Ingrese el nuevo grupo primario:   "  STDIN
        Group=$STDIN
        if sudo usermod -g "$Group" $UserName
        then 
            echo "Cambio de directorio exitoso!"
        else
            echo "Error cambiando de directorio :("
        fi
    ;;

    d|D)
        clear
        read -p "Ingrese el nuevo directorio:   "  STDIN
        Directory=$STDIN
        if sudo usermod -d $Directory $UserName
        then 
            echo "Cambio de directorio exitoso!"
        else
            echo "Error cambiando de directorio :("
        fi
    ;;

    e|E)
        clear
        read -p "Ingrese el nuevo shell /bin/<nuevo>:   "  STDIN
        Shell=$STDIN
        if sudo usermod -s /bin/$Shell $UserName
        then 
            echo "Cambio de directorio exitoso!"
        else
            echo "Error cambiando de directorio :("
        fi
    ;;

    f|F)
        clear
        read -p "Ingrese el nuevo nombre para Log-in:   "  STDIN
        Login=$STDIN
        if sudo usermod -l $Login $UserName
        then 
            echo "Cambio de nombre exitoso!"
        else
            echo "Error cambiando de nombre :("
        fi
    ;; 

    g|G)
        clear
        read -p "Ingrese el nuevo ID:   "  STDIN
        ID=$STDIN
        if sudo usermod -u $ID $UserName
        then 
            echo "Cambio de directorio exitoso!"
        else
            echo "Error cambiando de directorio :("
        fi
    ;; 

    h|H)
        clear
        read -p "Ingrese fecha de expiracion de la manera YYYY-MM-DD :   "  STDIN
        Expire=$STDIN
        if sudo usermod -e $Expire $UserName
        then 
            echo "Cambio de directorio exitoso!"
        else
            echo "Error cambiando de directorio :("
        fi
    ;;

    i|I)
        clear
        read -p "Seguro desea bloquear al usuario $UserName ?  Y/n "  OPCION
        case $OPCION in
        Y|y)
            if sudo usermod -L $UserName
            then
                echo "Usuario bloqueado con exito!"
            else    
                echo "Error al bloquear al usuario :("
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

    j|J)
        clear
        read -p "Seguro desea desbloquear al usuario $UserName ?  Y/n "  OPCION
        case $OPCION in
        Y|y)
            if sudo usermod -U $UserName
            then
                echo "Usuario desbloqueado con exito!"
            else    
                echo "Error al desbloquear al usuario :("
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

    k|K)
        clear
        echo Grupos a los que $UserName pertence:
        id $UserName | cut -d " " -f3
        read -p "Ingrese el grupo del que sera eliminado el usuario: " STDIN
        DelFromGroup=$STDIN
        if sudo gpasswd -d $UserName $DelFromGroup
        then 
            echo "Usuario eliminado del grupo con exito!"
        else
            echo "Error al eliminar del grupo :("
        fi
    ;;

    0)
        I=1
    ;;
    esac
done