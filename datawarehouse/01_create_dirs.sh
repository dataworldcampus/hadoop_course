# Crear el árbol de directorios para el almacén de datos 

# Datos en bruto
hadoop fs -mkdir /raw/landing 
hadoop fs -mkdir /raw/landing/year 
hadoop fs -mkdir /raw/landing/year/month 
hadoop fs -mkdir /raw/landing/year/month/day 
hadoop fs -mkdir /raw/landing/year/month/day/crm 
hadoop fs -mkdir /raw/archive/year 
hadoop fs -mkdir /raw/archive/year/month 
hadoop fs -mkdir /raw/archive/year/month/day 
hadoop fs -mkdir /raw/archive/year/month/day/crm 

# Procesos ETL
hadoop fs -mkdir /etl/tutorial/datawarehouse/
hadoop fs -mkdir /etl/tutorial/datawarehouse/process/
hadoop fs -mkdir /etl/tutorial/datawarehouse/process/in
hadoop fs -mkdir /etl/tutorial/datawarehouse/process/out 
hadoop fs -mkdir /etl/tutorial/datawarehouse/process/tmp

# Datos procesados y derivados
hadoop fs -mkdir /data
hadoop fs -mkdir /data/tutorial
hadoop fs -mkdir /data/tutorial/datawarehouse

# Código de las aplicaciones
hadoop fs -mkdir /app
hadoop fs -mkdir /app/tutorial
hadoop fs -mkdir /app/tutorial/datawarehouse
