#!/bin/bash
#Este Script nos crea un archivo de texto

crear_archivo(){  #Aqui esta la Funcion
        nombre=$1 #Parametros
        touch $1.txt
        if [ $? -eq 0 ]; #Usamo IF
        then
                echo "Se creo el archivo de texto"
                ls | tee  #Usamos PIPE
        fi
}
crear_archivo