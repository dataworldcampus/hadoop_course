# Crear dir para codigo compilado
mkdir build
# Compilar codigo java y dejarlo en dir build
javac -cp /usr/lib/hadoop/*:/usr/lib/hadoop-mapreduce/* WordCountMapReduce.java -d build -Xlint

