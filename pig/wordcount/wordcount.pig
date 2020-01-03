-- En estos comentarios evitar el uso de acentos y caracteres no estandar

-- Lee fichero usando PigStorage para especificar como estructurar los datos de entrada, en este caso lineas sepearadas por salto de linea
-- Cada linea es accesible mediante linesin
wordfile = LOAD '/user/cloudera/datawarehouse/data/order_reviews_dataset.csv' USING PigStorage('\n') as (linesin:chararray);

-- Accedo a cada palabra wordin 
-- TOKENIZE: parte una cadena en una bolsa de palabras
-- FLATTEN: desanida tuplas y bolsas de palabras
wordfile_flat = FOREACH wordfile GENERATE FLATTEN(TOKENIZE(linesin)) as wordin;

-- Agrupo por palabra
wordfile_grpd = GROUP wordfile_flat by wordin;

-- Cuento ocurrencias de cada palabra
word_counts = FOREACH wordfile_grpd GENERATE group, COUNT(wordfile_flat.wordin);

STORE word_counts into '/user/cloudera/datawarehouse/out/pig_wordcount';
