#Una v.a. continua X responde a un proceso Gaussiano de media cero y sigma = 1
#
# (a) Simular varias realizaciones de X y estimar la pdf usando el m�todo del 
# histograma
#
# (b) Variar la cantidad de bins y sacar conclusiones acerca de la calidad de 
# estimaci�n

# Generamos la variable aleatoria
x=randn(1,10000);

# Armamos el histograma de los datos (pseudo)-aleatorios

# Con 10 bins
figure;
hist(x,10);
title('10 bins')

#Con 100 bins
figure;
hist(x,100);
title('100 bins')

#Con 1000 bins
figure;
hist(x,1000);
title('1000 bins')

# Conclusi�n: Claramente al aumentar la greanularidad del histograma tenemos una
## mejor representaci�n de la pdf de la V.A.