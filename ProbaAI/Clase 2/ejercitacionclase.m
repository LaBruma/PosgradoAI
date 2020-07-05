# Convolución
X=[1,2,3,4];
X=conv(X,X)

# Media móvil (moving average)
X=[1,2,3,1,2,3,1,2,3];
H=[1/3,1/3,1/3];
S=conv(X,H);
figure;stem(S)

# Suma de variables aleatorias normales
X=randn(1000,1);
Y=randn(1000,1);
W=randn(1000,1);
Z=X+Y+W;
figure;
hist(Z,100,'facecolor','r')
hold on
hist(X,100,'facecolor','b')

# Función de variables aleatorias
X = rand(1000,1);
# Y = X^2 --> X=sqrt(Y) :Ojo que esto vale en [0,1], que justo es donde está
## definida X

# Variables correlacionadas
X = randn(1000,1);
Y= X+randn(1000,1);
#plot(X,Y)
scatter(X,Y)

# Variables descorrelacionadas
X = randn(1000,1);
Y= randn(1000,1);
scatter(X,Y)

U=randn(1000,1);
V=randn(1000,1);
X=1*U+0*V;
Y=1*U+0.1*V;
figure; scatter(X,Y)

# Ejercicios de la semana
#========================
# Ejercicio1


# Ejercicio2

V=0.2*randn(1000,1); # Cambiamos la varianza
figure; scatter(U,V)
# Aunque estén descorrelacionada el gráfico no es un círculo

# Lo mismo pasa si cambiamos las medias (que se puede cambiar sumando un número)

#Ejercicio 3

#Ejercicio 4

