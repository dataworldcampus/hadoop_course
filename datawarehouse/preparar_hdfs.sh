# Crear dir en HDFS para aplicacion
hadoop fs -mkdir /user/cloudera/datawarehouse

# Crear dir en HDFS para salida 
hadoop fs -mkdir /user/cloudera/datawarehouse/out

# Copiar datos a HDFS
hadoop fs -put /home/cloudera/workspace/hadoop_course-master/datawarehouse/data/* /user/cloudera/datawarehouse

