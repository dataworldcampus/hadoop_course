# Crear dir en HDFS para aplicacion
hadoop fs -mkdir /home/cloudera/datawarehouse

# Copiar datos a HDFS
hadoop fs -put /home/cloudera/workspace/hadoop_course/datawarehouse/data/* /home/cloudera/datawarehouse

