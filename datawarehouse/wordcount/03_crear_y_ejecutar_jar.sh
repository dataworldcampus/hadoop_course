# Borrar dir salida en HDFS
hadoop fs -rm /etl/tutorial/datawarehouse/wordcount/out/*
hadoop fs -rmdir /etl/tutorial/datawarehouse/wordcount/out

# Crear ejecutable jar 
jar -cvf wordcount.jar -C build/ .

# Ejecutar pasando fichero/s de entrada y dir de salida
hadoop jar wordcount.jar org.myorg.WordCount /etl/tutorial/datawarehouse/wordcount/in/* /etl/tutorial/datawarehouse/wordcount/out 

# Mostrar la salida
hadoop fs -cat /etl/tutorial/datawarehouse/wordcount/out/*

