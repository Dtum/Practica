import os
from ftplib import FTP
import ftplib

#Nos Conectamos Al Servidor
ftp = FTP("ftp.us.debian.org")
if ftp.login():
    print("¡Conectado!")
else:
    print("No se puede conectar")



#entramos a los directorios que necesitamos y creamos la carpeta de almacenamiento
ls = []
ftp.cwd('debian') 
ftp.retrlines('LIST', ls.append)
[line for line in ls if line.startswith('dr') ]
ls
[line for line in ls if line.startswith('l') ]
ls

#Establecemos las Terminaciones
a = ".html"
b = ".msg"
c = ".txt"

#Descargamos los Archivos
for i in ls:
    if c in i:
        if os.path.isfile(b):
            ftp.retrbinary("RETR %s" %c, open(c, 'wb').write)
    if a in i:
        if os.path.isfile(a):
            ftp.retrbinary("RETR %s" %a, open(a, 'wb').write)
    if b in i:
        if os.path.isfile(b):
            ftp.retrbinary("RETR %s" %b, open(b, 'wb').write)
ftp.close()

    
