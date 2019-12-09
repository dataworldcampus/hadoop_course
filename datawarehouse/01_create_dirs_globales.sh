# Crear el árbol de directorios para el almacén de datos 

# Datos en bruto
hadoop fs -mkdir /raw 
hadoop fs -mkdir /raw/landing 
hadoop fs -mkdir /raw/landing/year 
hadoop fs -mkdir /raw/landing/year/month 
hadoop fs -mkdir /raw/landing/year/month/day 
hadoop fs -mkdir /raw/landing/year/month/day/crm 
hadoop fs -mkdir /raw/archive 
hadoop fs -mkdir /raw/archive/year 
hadoop fs -mkdir /raw/archive/year/month 
hadoop fs -mkdir /raw/archive/year/month/day 
hadoop fs -mkdir /raw/archive/year/month/day/crm 

# Dir para ETLs
hadoop fs -mkdir /etl
# Dir por proyecto/equipo/departamento
hadoop fs -mkdir /etl/tutorial
# Dir por aplicacion
hadoop fs -mkdir /etl/tutorial/datawarehouse/
# Para cada proceso ETL se crea un dir con in, out y tmp
hadoop fs -mkdir /etl/tutorial/datawarehouse/wordcount/
hadoop fs -mkdir /etl/tutorial/datawarehouse/wordcount/in
hadoop fs -mkdir /etl/tutorial/datawarehouse/wordcount/out 
hadoop fs -mkdir /etl/tutorial/datawarehouse/wordcount/tmp

# Datos procesados y derivados
hadoop fs -mkdir /data
hadoop fs -mkdir /data/tutorial
hadoop fs -mkdir /data/tutorial/datawarehouse

# Código de la aplicacion
hadoop fs -mkdir /app
hadoop fs -mkdir /app/tutorial
hadoop fs -mkdir /app/tutorial/datawarehouse
hadoop fs -mkdir /app/tutorial/datawarehouse/wordcount
