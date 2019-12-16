# Cuenta de palabras en Spark

# En una sesion interactiva abierta con el comando pyspark, las siguientes dos lineas deben omitirse ya que dentro de la sesion abierta por pyspark ya habra un SparkContext llamado sc, listo para ser usado
from pyspark import SparkContext
sc = SparkContext()

# Leemos el fichero de opiniones de clientes 
# Este fichero debe estar en HDFS en la ruta indicada
textFile = sc.textFile("/user/cloudera/datawarehouse/order_reviews_dataset.csv")

# Aplicamos un map para emitir tuplas (word, 1) y luego reduceByKey para contar el numero de apariciones de cada palabra
wordCounts = textFile.flatMap(lambda line: line.split()).map(lambda word: (word, 1)).reduceByKey(lambda a, b: a+b).cache()

# Si lanzamos el codigo con spark-submit deberiamos escribir los resultados en un fichero
wordCounts.saveAsTextFile("/user/cloudera/out/wordcount")

# Para ver los resultados en HDFS
#hadoop fs -cat /user/cloudera/out/wordcount/*

# En una sesion interactiva mostramos por pantalla los resultados 
# Accion para ordenar los resultados y devolver una lista con los top 1000 
#top_list = wordCounts.takeOrdered(1000, lambda x: -x[1])
#print top_list


