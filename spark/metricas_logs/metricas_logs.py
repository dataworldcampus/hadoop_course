# -*- coding: utf-8 -*-
# Ejecutar con spark-submit --master local[1] metricas_logs.py
import re
from pyspark.sql import Row


from pyspark import SparkContext
sc = SparkContext()
sc.setLogLevel("ERROR")

from pyspark.sql import SQLContext
sqlContext = SQLContext(sc)

# Previamente se ha copiado este fichero de /opt/examples/log_files/access.log.2 en la MV quickstart de Cludera a este dir HDFS
fichero_logs = "/user/cloudera/log_files/access.log.2"

# Para parsear líneas de log como esta: 
# 114.98.234.12 - - [10/Oct/2014:00:01:21 ] "GET /handle-bars HTTP/1.0" 200 3143 "http://bleater.com" "Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0)"
PATRON_LOGS_APACHE = '^(\S+) (\S+) (\S+) \[(.*?)\] "(\S+) (\S+) (\S+)" (\d{3}) (\d+) "(.*?)" "(.*?)"'
 
# Si se ejecuta este codigo de forma interactiva, se puede importar esta funcion de parseo de logs de la siguiente manera
# sc.addFile("/home/cloudera/workspace/hadoop_course-master/spark/metricas_logs/metricas_import.py")
# from  metricas_import import parsear_linea_log

# Devuelve un diccionario con los campos de un log de acceso estandar de Apache 
def parsear_linea_log(logline):
    match = re.match(PATRON_LOGS_APACHE, logline)
    if match is None:
        # Error si la linea no tiene un formato valido 
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

 
lineas = sc.textFile(fichero_logs)
lineas.first()
filas_parseadas = lineas.map(parsear_linea_log).cache()
print "===================="
print "  Líneas parseadas"
print "===================="
#print filas_parseadas.take(10)
print filas_parseadas.first()

# Para mostrar resultados en formato tabla, pasar a dataframe y usar show()
df = filas_parseadas.toDF()
df.show()

#############################################
# Calcular e imprimir las siguientes métricas
#############################################
# Estadísticas del tamaño de las páginas servidas: media, máximo (usar max()) y mínimo (usar min())
tamanos_contenido = filas_parseadas.map(lambda fila: fila.tamano_contenido).cache()
suma_tamanos_contenido = tamanos_contenido.reduce(lambda x,y: x + y)
numero_filas = tamanos_contenido.count()
tamano_medio_contenido = suma_tamanos_contenido / numero_filas 
min_contenido = tamanos_contenido.min()
max_contenido = tamanos_contenido.max()
print "Estadísticas tamaño de página (media, min, max): %.2f, %d, %d" % (tamano_medio_contenido, min_contenido, max_contenido)

# Frecuencia de cada rango de tamaño de página
tramo = (max_contenido - min_contenido) / 10
pares_tamano_cuenta = (filas_parseadas.map(lambda fila: (int((fila.tamano_contenido - min_contenido) / tramo), 1)).reduceByKey(lambda x,y: x+y))
print "=============================="
print "  Tamaño de página / Cuenta"
print "=============================="
df = pares_tamano_cuenta.toDF()
df.show()

# Top 10 de páginas vistas
# takeOrdered devuelve un array
top_urls = filas_parseadas.map(lambda fila: (fila.url, 1)).reduceByKey(lambda x,y: x+y).takeOrdered(10, lambda x: -x[1]) 
print "\n10 top urls:"
print top_urls 


# Qué IPs han accedido al servidor más de 5 veces
ips_frecuentes = (filas_parseadas
		  .map(lambda fila: (fila.ip, 1))
		  .reduceByKey(lambda x,y: x+y)
		  .filter(lambda x: x[1] > 5)
		  .map(lambda x: x[0])
		  .take(100)) 
print "\nDirecciones IP que han accedido hoy más de 5 veces: %s\n" % (ips_frecuentes)

