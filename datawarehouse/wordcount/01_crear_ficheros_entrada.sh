# Crear dir en HDFS para aplicacion
hadoop fs -mkdir /home/cloudera/wordcount

# Copiar datos a HDFS
hadoop fs -put /home/cloudera/Downloads/hadoop_course/datawarehouse/wordcount/data/* /home/cloudera/wordcount

