# Ejercicio 2
# Sean X; Y dos v.a. normales cero-uno correlacionadas con rhoXY = 0,5. Se tiene 
## que var[X] = 2 var[Y ] = 1.
#(a) Encontrar la expresión de la pdf conjunta de X;Y
#(c) Proyectar x = [X Y ]T sobre w = [1 1]T y encontrar la pdf de la proyección.

# item a
#=======
#
# pdf conjunta
# 
# Var[X] = 1 => sigmaX = 1
# Var[Y] = 0.5 * Var[X] = 0.5 => sigmaY = 1/sqrt(2)
#
# fXY (x,y) = 1/(2*pi*sqrt(1/2)*sqrt(3/4))*exp(-1/(3/2)*(X^2-X*Y+Y^2)

X=randn(1000,1);
Y=0.5*randn(1000,1); # Cambiamos la varianza
# No tengo idea qué a y qué b corresponden a rho = 0.5...
a = 0.5;
b = 2;
Z_ind = a*X + b*Y;
figure; scatter(X,Z_ind); axis("equal")

# Pero lo puedo hacer exacto con la función mvnrnd
rho = 0.5;
sigmaX = 1 ;
sigmaY = 1/sqrt(2) ;
Cov = sigmaX.^2 .* [sigmaX.^2 rho*sigmaX*sigmaY; rho*sigmaX*sigmaY sigmaY.^2];

Z_dep = mvnrnd([0 0], Cov, 1000);

figure; scatter(Z_dep(:,1),Z_dep(:,2)); axis("equal")

# item b
#=======
w = [1,1]';
Proy = Z_dep*w;

# Pdf (Gaussiana de media w'^mu, desvío w'*Cov*w)
mu = w'*[0;0];
sigma = w'*Cov*w;
 
figure;
hist(Proy,100)