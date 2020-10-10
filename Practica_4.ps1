function ver-menu{  
    Write-Host("===============MENU=================")
    Write-host("[1].Si deseas eliminar todos los archivos de una carpeta")
    write-host("[2].Si deseas Mover Todos los archivos de una carpeta")
    Write-Host("[3].Si deseas salir del menu")
    Write-Host("====================================")
}

function eliminar-archivos{

    [CmdletBinding()] param([Parameter(Mandatory)] [string] $ruta_del_archivo )  #ESTA FUNCION SI TIENE PARAMETRO
    Get-ChildItem -Path $ruta_del_archivo -Recurse | Remove-Item     #Utilizamos PIP para eliminar archivos
    Write-Host ("Tus archivos fueron Removidos con exito")
    }

function mover-archivos{
    
    [CmdletBinding()] param([Parameter(Mandatory)] [string] $ruta_del_archivo) #ESTA FUNCION TAMBIEN TIENE PARAMETRO
    $ruta_destino = Read-Host "Introduce la ruta a donde lo quieras enviar"
    Get-ChildItem -Path $ruta_del_archivo -Recurse | Move-Item -Destination $ruta_destino   #Esta Funcion Tambien tiene Pip
    Write-Host ("Tus archivos fueron Movidos con exito")
}



do{    #INICIAR EL CICLO DO-WHILE QUE REPITA EL MENU HASTA QUE EL USUARIO DECIDA SALIR
Ver-Menu
$opcion = Read-Host "escoga una opcion"

switch ($opcion)
{
    1 {eliminar-archivos}
    2 {mover-archivos}
    3 {break}

    default {write-host "¡ERROR!.....Vuelve a intentarlo"}
    }
    } while ($opcion -ne 3)  
