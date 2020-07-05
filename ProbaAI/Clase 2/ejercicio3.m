# ejercicio3
#===========
# Usando el método de la transformada inversa, calcular la pdf de la distribución 
## exponencial fY (y) = lambda*exp(-lambda*y) para y >= 0, o fY (y) = 0 si
# y < 0. Usar un valor arbitrario de lambda > 0
# (b) Simular en Octave
#
# La función es decreciente => FY(y) = 1-FX(h(y))
#
# La transformada inversa es x=lambda+ln(y/lambda)
#
# x=U[0,1] => y vale entre [lambda*exp(-lambda),1]
#
# h(y)= (-1/lambda)*log(y/lambda)
#
# dh(y)/dy = (-1/lambda)*y
#
# Peeero, no se cómo usar esto... :(
#
# En qué se diferencia el método visto en clase con este?:
#
# Calcular la acumulada de fY, o sea FY
#
# FY(y)=lambda*(1/(-lambda)*exp(-lambda*y)) = -exp(-lambda*y) evaluado entre 0 y
## 1
#
# Entonces: FY(y) = 1-exp(-lambda*y)
#
# Luego encontramos la inversa: y = -ln(1-x)/lambda
#
# Y esta es la que usamos con x como variable uniforme [0,1]

# Siendo así creería que este es el resultado...
lambda = 1;
U = rand(1000,1);
Y=(-1/lambda)*log(1-U)
figure; hist(Y,100)