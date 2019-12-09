# Crear dir para codigo compilado
#mkdir build

# Compilar codigo java y dejarlo en dir build
#javac -cp /usr/lib/hadoop/*:/usr/lib/hadoop-mapreduce/* WordCountMapReduce.java -d build -Xlint
javac -cp /usr/lib/hadoop/*:/usr/lib/hadoop-mapreduce/* WordCountMapReduce.java -Xlint

# Crear ejecutable jar 
#jar -cvf wordcount.jar -C build/ .
jar -cvf wordcountmapreduce.jar .

