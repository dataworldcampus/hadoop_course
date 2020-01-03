# Si se quiere ejecutar de nuevo el script de Pig, hay que borrar el dir de salida para que no de error
hadoop fs -rm /user/cloudera/pig_wordcount/out/* 
hadoop fs -rmdir /user/cloudera/pig_wordcount/out 
