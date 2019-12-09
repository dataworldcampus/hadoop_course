# Crear ejecutable jar 
jar -cvf wordcount.jar -C build/ .

# Ejecutar pasando fichero/s de entrada y dir de salida
hadoop jar wordcount.jar org.myorg.WordCount /home/cloudera/wordcount/* /home/cloudera/out 

# Mostrar la salida
hadoop fs -cat /home/cloudera/out/*

