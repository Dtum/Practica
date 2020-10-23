from bs4 import BeautifulSoup
import requests

url = "https://www.uanl.mx/oferta/" 
page = requests.get(url)
soup = BeautifulSoup(page.content, "html.parser")

facultades = soup.find_all(class_="form-control")  #De toda la pagina Html, Buscamos la clase seleccionada
lista=[]

for i in facultades:
    lista.append(i.text)   
lista.pop(1)


string = "".join(lista)                 #Convertimos la Lista en String

buscar = "Seleccionar escuela o facultad"
reemplazar = ""



print("LAS FACULTADES DE LA UNI SON: ")
print(string.replace(buscar,reemplazar))  #Aplicamos el reemplazo y mostramos las facultades

