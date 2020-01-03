/* 
Lee fichero usando PigStorage para especificar como estructurar los datos de entrada, en este caso es un csv con campos separados por comas. 
*/

csv_data = LOAD '/user/cloudera/datawarehouse/order_reviews_dataset.csv' USING PigStorage(',') as (review_id:chararray, order_id:chararray, score:chararray, title:chararray, comment:chararray);

DUMP csv_data;

comentarios = FOREACH csv_data GENERATE $4;
DUMP comentarios;

-- Accedo a cada palabra del comentario 
-- TOKENIZE: parte una cadena en una bolsa de palabras
-- FLATTEN: desanida tuplas y bolsas de palabras
wordfile_flat = FOREACH comentarios GENERATE FLATTEN(TOKENIZE($0)) as wordin;

-- Agrupo por palabra
wordfile_grpd = GROUP wordfile_flat by wordin;

-- Calculo frecuencia de cada palabra
word_counts = FOREACH wordfile_grpd GENERATE group, COUNT(wordfile_flat.wordin) as cnt;

-- Ordeno de palabras mas frecuentes a menos frecuentes
word_counts_des = ORDER word_counts BY cnt DESC;

-- Escribo en HDFS
STORE word_counts_des into '/user/cloudera/pig_wordcount/out';
