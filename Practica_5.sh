#!/bin/bash
decodificar(){
	echo "=====DECODIFICACION====="
        cat mystery_img1.txt | base64 --decode > mystery1DECODIFICADO.png
        echo "Primera Imagen DECODIFICADA y GUARDADA"
        cat mystery_img2.txt | base64 --decode > mystery2DECODIFICADO.png
        echo "Segunda Imagen DECODIFICADA y GUARDADA"
        # LOS DECODIFICO Y GUARDO, PORQUE SI LOS MUESTRO, SE MOSTRARIA MUCHO TEXTO
}
decodificar
codificar(){ 
	echo "=====CODIFICACION====="
        cat fcfm.png  | base64 > fcfm.txt
        echo "Imagen CODIFICADA Y GURDADA"
        cat msg.txt | base64  > msgCODIFICADO.txt         
        echo "TEXTO CODIFICADO Y GUARDADO"
        #DE IGUAL MANERA, SOLO GUARDO Y CODIFICO
}
codificar
check(){
	echo "=====UTILIZANDO MD5SUM==="
	md5sum fcfm.png
	md5sum mystery_img1.txt
	md5sum mystery_img2.txt
	md5sum msg.txt
        #AQUI AL SER POCO TEXTO, SOLO LO MOSTRER DIRECTAMENTE
}
check