# Borrar dir salida en HDFS
hadoop fs -rm /user/cloudera/out/wordcount/*
hadoop fs -rmdir /user/cloudera/out/wordcount

# Ejecutar pasando fichero/s de entrada y dir de salida
hadoop jar wordcountmapreduce.jar WordCountMapReduce /user/cloudera/datawarehouse/* /user/cloudera/out/wordcount 

# Mostrar la salida
hadoop fs -cat /user/cloudera/out/wordcount/*

