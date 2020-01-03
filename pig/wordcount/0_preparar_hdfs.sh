#!/bin/bash
# Para que el script de Pig funcione correctamente se require que exista el fichero de opiniones en la ruta adecuada de HDFS 
hadoop fs -put /home/cloudera/workspace/hadoop_course-master/datawarehouse/data/order_reviews_dataset.csv /user/cloudera/datawarehouse/ 
