#!/bin/bash

mostrar_bienvenida() {
    echo "-----------------------------------------------------"
    echo "BIENVENIDO AL GENERADOR DE CLAVES RSA"
    echo "-----------------------------------------------------"
    echo
}

mostrar_menu() {
    echo "##########################################"
    echo "#         MENU DE OPCIONES               #"
    echo "#     1. GENERAR CLAVE PRIVADA           #"
    echo "#     2. GENERAR CLAVE PUBLICA           #"
    echo "#     3. VISUALIZAR CLAVES               #"
    echo "#     4. ELIMINAR CLAVES                 #"
    echo "#     5. CALCULAR FUNCIÓN ASH            #"
    echo "#     6. CALCULAR HASH MD5               #"
    echo "#     7. ACERCA DEL DESARROLLADOR        #"
    echo "#     8. SALIR DEL SISTEMA               #"
    echo "##########################################"
    echo
}

generar_clave_privada() {
    echo "INGRESE EL NOMBRE PARA LA CLAVE PRIVADA"
    read nombre_privada
    openssl genrsa -out "${nombre_privada}.pem" 4096
    echo "SE GENERÓ LA CLAVE PRIVADA EN EL ARCHIVO: ${nombre_privada}.pem"
    echo
}

crear_clave_publica() {
    echo "INGRESE EL NOMBRE PARA LA CLAVE PUBLICA"
    read nombre_publica
    echo "AHORA DEBE INGRESAR EL NOMBRE DE LA CLAVE PRIVADA GENERADA ANTERIORMENTE"
    read nombre_privada
    openssl rsa -in "${nombre_privada}.pem" -pubout -out "${nombre_publica}.pem"
    echo "SE GENERÓ LA CLAVE PUBLICA EN EL ARCHIVO: ${nombre_publica}.pem"
    echo
}

visualizar_claves(){
    echo "-----------------------------------------------------------------------"
    echo "LISTADO DE CLAVES GENERADAS"
    echo "-----------------------------------------------------------------------"
    echo
    ls *.pem
    echo "-----------------------------------------------------------------------"
    echo
}

eliminar_claves() {
    echo "-----------------------------------------------------------------------"
    echo "¿ESTÁS SEGURO DE ELIMINAR LAS CLAVES GENERADAS? (S/N)"
    read confirmacion

    if [[ $confirmacion == "S" || $confirmacion == "s" ]]; then
        rm -f *.pem
        echo "LAS CLAVES SE ELIMINARON CORRECTAMENTE"
    else
        echo "OK, LAS CLAVES ESTÁN INTACTAS."
    fi
    echo "-----------------------------------------------------------------------"
    echo
}

acerca_de() {
    clear
    echo "---------------------------------------------------------------------------------"
    echo "DESARROLLADO POR KEVIN GÓMEZ CANTILLO"
    echo "---------------------------------------------------------------------------------"
    echo
    echo "####################################"
    echo "#              FUENTES             #"
    echo "####################################"
    echo "#    https://www.openssl.org/      #"
    echo "#    Un forense llevado a juicio   #"
    echo "#    https://github.com/kevin-sys  #"
    echo "####################################"
    echo
}

calcular_ash() {
    echo "INGRESE EL NOMBRE DE LA IMAGEN ISO CREADA EN FTK IMAGER"
    read iso_ftk_imager
    openssl dgst -sha256 "${iso_ftk_imager}"
    echo "SE CALCULÓ LA FUNCIÓN ASH DEL ARCHIVO ${iso_ftk_imager}"
    echo
}

calcular_hash_md5() {
    echo "INGRESE EL NOMBRE DEL ARCHIVO PARA CALCULAR EL HASH MD5"
    read archivo_md5
    openssl dgst -md5 "${archivo_md5}"
    echo "SE CALCULÓ EL HASH MD5 DEL ARCHIVO ${archivo_md5}"
    echo
}

mostrar_bienvenida

opcion=0

while [[ opcion -ne 8 ]]; do
    mostrar_menu
    echo "INGRESE UNA OPCIÓN"
    read opcion
    echo
    
    case ${opcion} in
        1)
            generar_clave_privada
            ;;
        2)
            crear_clave_publica
            ;;
        3)
            visualizar_claves
            ;;
        4)
            eliminar_claves
            ;;
        5)
            calcular_ash
            ;;
        6)
            calcular_hash_md5
            ;;
        7)
            acerca_de
            ;;
        8)
            echo "GRACIAS POR USAR EL SISTEMA, HASTA LUEGO... :) :) :)"
            echo
            ;;
        *)
            echo "OPCIÓN INVÁLIDA, POR FAVOR SELECCIONE UNA OPCIÓN VÁLIDA"
            echo
            ;;
    esac
done
