# Vuelca el contenido de todos los ficheros que haya en el dir indicado
# El resultado se pasa al comando head para que se muestren solo las 100 palabras mas frecuentes
hadoop fs -cat /user/cloudera/pig_wordcount/out/* | head -n 100
