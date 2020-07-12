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
# E[X|Z] = E[X|X+Y] = X?
#
# E[XZ|X]= E[X(X+Y)|X] = E[XX|X] + E[XY|X] = X*E[X|X] + X*E[Y|X] = X^2 + X/2
#
# E[XZ|Z]= E[X(X+Y)|X+Y] = E[XX|X+Y] + E[XY|X+Y] = X*E[X|X+Y] + X*E[Y|X+Y] =
## X^2 + X*Y
#
# Para mí en 1 y 3 tiré fruta...
