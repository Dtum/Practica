#!/usr/bin/env Python
import argparse
import requests
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
import smtplib
import json


#Establecemos Los Argumentos

parser = argparse.ArgumentParser(description="Enviar Correos")
parser.add_argument("-Destinatario", "--Destinatario", metavar="", type=str, help="Correo hacia quien se dirige")
parser.add_argument("-Asunto", "--Asunto", metavar="", type=str, help="Que asunto va a tener el mensaje")
parser.add_argument("-Mensaje", "--Mensaje", metavar="", type=str, help="El mensaje que vas a enviar")
args = parser.parse_args()

def Correo(Destinatario,Mensaje,Asunto):
    #Validamos Nuestros Datos
    data = {}
    with open(r'pass.json') as f:
        data = json.load(f)


    #Validando la creacion de Mensaje
    msg = MIMEMultipart()
    message = Mensaje
    msg['From'] = data['user']

    #Parametros para el correo
    msg['To'] = Destinatario
    msg['Subject'] = Asunto
    msg.attach(MIMEText(message, 'plain'))

    # crear servidor
    server = smtplib.SMTP('smtp.gmail.com:587')
    server.starttls()

    # Cargando el usuario y contraseña
    server.login(data['user'], data['pass'])

    #Eviando mensaje
    server.sendmail(msg['From'], msg['To'], msg.as_string())

    #Saliendo del Servidor
    server.quit()

    #Mostramos Mensaje
    return("CORREO EXITOSAMENTE ENVIADO A  %s:" % (msg['To']))


if __name__ == '__main__':
    print(Correo(args.Destinatario,args.Mensaje,args.Asunto))
