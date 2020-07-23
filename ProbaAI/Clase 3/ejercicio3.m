# ejercicio 3
#============
#
#Sean X; Y v.a. U[0; 1] independientes. Definamos Z = X + Y. Encontrar E[Z|X];  
## E[X|Z]; E[XZ|X]; E[XZ|Z].
#
# X,Y ~ U[0,1] independientes
#
# Z=X+Y
#
# E[Z|X] = E[X+Y|X] = E[X|X] + E[Y|X] = X + E[Y] = X+1/2
#
# E[X|Z] = E[X|X+Y] = Z/2 = (X+Y)/2
#
# E[XZ|X]= E[X(X+Y)|X] = E[XX|X] + E[XY|X] = X*E[X|X] + X*E[Y|X] = X^2 + X/2
#
# E[XZ|Z]= ZE[X|Z] = Z*Z/2 = Z^2/2 = (X+Y)^2/2 = (X^2+2XY+Y^2)/2
#
N=10000;

X=rand(N,1)
Y=rand(N,1)
Z = X+Y;

delta = 0.05;

X_index = find(X<delta);
Z_index = find(Z<delta);

E_Z_dado_X=mean(Z(X_index));
E_X_dado_Z=mean(X(Z_index));