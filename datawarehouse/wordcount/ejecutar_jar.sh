# Borrar dir salida en HDFS
hadoop fs -rm /user/cloudera/out/*
hadoop fs -rmdir /user/cloudera/out

# Ejecutar pasando fichero/s de entrada y dir de salida
hadoop jar wordcountmapreduce.jar org.myorg.WordCountMapReduce /user/cloudera/datawarehouse/* /user/cloudera/out 
# Mostrar la salida
hadoop fs -cat /user/cloudera/out/*

