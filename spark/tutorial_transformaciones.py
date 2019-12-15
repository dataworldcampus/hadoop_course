# map
# devuelve un nuevo RDD aplicando la función dada a cada elemento del RDD
x = sc.parallelize(["b", "a", "c"])
y = x.map(lambda z: (z, 1))

print(x.collect())
print(y.collect())

# ['b', 'a', 'c']
# [('a', 1), ('b', 1), ('c', 1)]

# filter
# devuelve un nuevo RDD conteniendo unicamente los elementos que satisfacen el predicado dado

x = sc.parallelize([1,2,3])
y = x.filter(lambda x: x%2 == 1) 
print(y.collect())

# flatmap
# devuelve un nuevo RDD aplicando una funcion a todos los elementos del RDD y "aplanando" los resultados 
x = sc.parallelize([1,2,3])
y = x.flatMap(lambda x: (x, x*100, 0)) print(x.collect())
print(y.collect())

# groupby
# agrupa los datos. El resultado son pares donde la clave es la salida de la funcion dada y el valor es todos los items para los cuales la funcion devuelve esa clave
x = sc.parallelize(['Ana', 'Pedro', 'Paco', 'Amelia', 'Julio']) 
y = x.groupBy(lambda w: w[0])
print [(k, list(v)) for (k, v) in y.collect()] 

# union
x = sc.parallelize([1,2,3], 2) 
y = sc.parallelize([3,4], 1) 
z = x.union(y) 
print(z.glom().collect())

# intersection
# devuelve un nuevo RDD conteniendo todos los pares de elementos que tienen la misma clave en el original
x = sc.parallelize([("a", 1), ("b", 2)])
y = sc.parallelize([("a", 1), ("a", 2), ("b", 3)]) 
z = x.join(y)
print(z.collect())

# subtract

# distinct

x=sc.parallelize([1,2,3,3,4]) 
y = x.distinct()
print(y.collect()) 

# cartesian

# keyBy
x = sc.parallelize(['Ana', 'Pedro', 'Paco', 'Amelia', 'Julio']) 
y = x.keyBy(lambda w: w[0])
print y.collect()

# max
c.parallelize([10,5,8]) 
y = x.max()
print(x.collect())
print(y)

# sum
c.parallelize([2,4,1]) 
y = x.sum()
print(x.collect()) 
print(y)


# groupby 
x = sc.parallelize(['Juan', 'Federico', 'Ana', 'Jana']) 
y = x.groupBy(lambda w: w[0])
print [(k, list(v)) for (k, v) in y.collect()]

# Pares clave valor
x = sc.parallelize([('B',5),('B',4),('A',3),('A',2),('A',1)]) 
y = x.groupByKey()
print(x.collect())
print(list((j[0], list(j[1])) for j in y.collect()))

#####################################
# Acciones
#####################################

# reduce
x = sc.parallelize([1,2,3,4]) 
y = x.reduce(lambda a,b: a+b)
print(x.collect()) 
print(y)


# countByKey
x = sc.parallelize([('J', 'Julia'), ('F','Federico'), ('B','Berta'), ('J','Juan')])
y = x.countByKey() 
print(y)
