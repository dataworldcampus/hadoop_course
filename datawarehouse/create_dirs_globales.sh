# Crear el árbol de directorios para el almacén de datos 
# Descomentar los comandos para proceder a la creacion del árbol

# Datos en bruto
#hadoop fs -mkdir -p /raw/landing/year/month/day/crm 
#hadoop fs -mkdir -p /raw/archive/year/month/day/crm 

# Para cada proceso ETL se crea un dir con in, out y tmp
#hadoop fs -mkdir -p /etl/tutorial/datawarehouse/wordcount/in
#hadoop fs -mkdir -p /etl/tutorial/datawarehouse/wordcount/out 
#hadoop fs -mkdir -p /etl/tutorial/datawarehouse/wordcount/tmp

# Datos procesados y derivados
#hadoop fs -mkdir -p /data/tutorial/datawarehouse

# Código de la aplicacion
#hadoop fs -mkdir -p /app/tutorial/datawarehouse/wordcount
