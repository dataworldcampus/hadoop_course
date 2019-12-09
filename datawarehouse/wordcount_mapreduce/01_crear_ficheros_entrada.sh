echo "blanco rojo azul" > colores1.txt
echo "azul rojo amarillo" > colores2.txt
echo "amarillo verde azul" > colores3.txt
hadoop fs -put colores*.txt /user/cloudera/ 
