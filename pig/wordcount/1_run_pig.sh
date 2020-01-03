#!/bin/bash
#	Pueden forzarse distintos modos de ejecucion. Por ej. 
#	pig -x local [nombre_script_pig]
#	pig -x mapreduce [nombre_script_pig]
#	Por defecto el modo de ejecucion es con mapreduce. En este caso la entrada y salida estaran en HDFS
#	Para que el script de Pig funcione correctamente se require que exista el fichero de opiniones en la siguiente ruta de HDFS: 
#	/user/cloudera/datawarehouse/order_reviews_dataset.csv
#	En caso de que no exista ya, copiarlo con: 
#	hadoop fs -put /home/cloudera/workspace/hadoop_course-master/datawarehouse/data/order_reviews_dataset.csv /user/cloudera/datawarehouse/ 
#	Ejecutamos el script con: 
pig wordcount.pig
