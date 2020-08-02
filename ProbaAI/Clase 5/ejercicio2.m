# Ejercicio 2
#===============================
#
# Un estudio hecho en 10 lamparitas muestra que el tiempo medio de duración en 
# horas es 998.9 hs. Las lamparitas tienen un desvío estándar típico de 
# sigma = 80 hs.
#
# (a) Encontrar el intervalo de confianza de 95% del tiempo medio de vida de 
# estas lamparitas
#
# (b) Encontrar el porcentaje del intervalo de confianza que tiene un rango
# total de horas de 80 hs. (Ayuda: desplazarse un +/- Delta_z a partir del
# valor medio u_est de manera que 80 = 2*Delta_z)
#

# item (a)
#---------
#
# Similar al ejercicio 1 --> z_alpha/2 de 1.96 para confianza del 95%
#
# P(u_est - 1.96 * sigma/sqrt(N) < u < u_est+1.96 * sigma/sqrt(N)) = 0,95

N = 10;
sigma = 80;
u_est = 998.9;

lim_izq = u_est-z_alpha2*sigma/sqrt(N);
lim_der = u_est+z_alpha2*sigma/sqrt(N);

# Intervalo: (949.32 ; 1048.5)hs

# item (b)
#---------
#
# Calculo que lo que pide es encontrar dónde z_alpha/2 * sigma/sqrt(N) se hace
# 40...o sea:
#
# z_alpha/2 = 40*sqrt(N)/sigma = 1.5811
#
# Lo que equivale a una confianza del 88.6%

confianza = 1-2*(1-normcdf(1.5811));