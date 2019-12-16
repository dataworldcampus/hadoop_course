# -*- coding: utf-8 -*-
import re
from pyspark.sql import Row

# Para parsear líneas de log como esta: 
# 114.98.234.12 - - [10/Oct/2014:00:01:21 ] "GET /handle-bars HTTP/1.0" 200 3143 "http://bleater.com" "Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0)"
PATRON_LOGS_APACHE = '^(\S+) (\S+) (\S+) \[(.*?)\] "(\S+) (\S+) (\S+)" (\d{3}) (\d+) "(.*?)" "(.*?)"'
 
# Returns a dictionary containing the parts of the Apache Access Log.
def parsear_linea_log(logline):
    match = re.match(PATRON_LOGS_APACHE, logline)
    if match is None:
        # Optionally, you can change this to just ignore if each line of data is not critical.
        # For this example, we want to ensure that the format is consistent.
        raise Exception("Linea de log no valida: %s" % logline)
    return Row(
        ip    		= match.group(1),
        cliente 	= match.group(2),
        id_usuario       = match.group(3),
        fecha_hora     	= match.group(4),
        metodo       	= match.group(5),
        url     	= match.group(6),
        protocolo     	= match.group(7),
        cod_respuesta 	= int(match.group(8)),
        tamano_contenido = long(match.group(9)), 
	referer	     	= match.group(10), 
	agente        	= match.group(11)
)

