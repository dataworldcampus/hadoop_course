hadoop fs -rm /user/cloudera/colores/*
hadoop fs -rmdir /user/cloudera/colores
jar -cvf wordcount.jar -C build/ .
hadoop jar wordcount.jar org.myorg.WordCount /user/cloudera/colores* /user/cloudera/colores
hadoop fs -cat /user/cloudera/colores/*
