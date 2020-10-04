function ver-menu{  #ESTA FUNCION NO TIENE PARAMETRO
    Write-Host("===============MENU=================")
    Write-host("[1].Si deseas eliminar un archivo")
    write-host("[2].Si deseas Copiar un archivo")
    Write-Host("[3].Si deseas salir del menu")
    Write-Host("====================================")
}

function eliminar-archivo{

    [CmdletBinding()] param([Parameter(Mandatory)] [string] $nombre_del_archivo )  #ESTA FUNCION SI TIENE PARAMETRO
    $ruta = Read-Host "Introduce la ruta del archivo"
    Remove-Item $ruta\$nombre_del_archivo
    Write-Host ("Tu archivo fue Removido con exito")
    }

function copiar-archivo{
    
    [CmdletBinding()] param([Parameter(Mandatory)] [string] $Nombre_del_Archivo) #ESTA FUNCION TAMBIEN TIENE PARAMETRO
    $ruta= Read-Host "Introduce solo la ruta actual de tu archivo"
    $ruta_destino = Read-Host "Introduce la ruta a donde lo quieras enviar"
    Copy-Item $ruta\$Nombre_del_Archivo -Destination $ruta_destino
    Write-Host ("Tu archivo fue Copiado con exito")
}



do{ #INICIAR EL CICLO DO-WHILE QUE REPITA EL MENU HASTA QUE EL USUARIO DECIDA SALIR
Ver-Menu
$opcion = Read-Host "escoga una opcion"

switch ($opcion)
{
    1 {eliminar-archivo}
    2 {copiar-archivo}
    3 {break}

    default {write-host "¡ERROR!.....Vuelve a intentarlo"}
    }
    } while ($opcion -ne 3)  

 