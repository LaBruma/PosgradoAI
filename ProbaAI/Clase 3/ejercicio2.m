# Ejercicio 2
#============
# Sea la longitud de una vara L. Supongamos que optamos por cortar la vara en un 
## lugar elegido uniformemente al azar Y . Nos quedamos con la parte de vara de 
## longitud entre [0; Y ]. Luego nuevamente decidimos partir la porción restante 
## en un lugar aleatoriamente elegido uniformemente, y llamamos a la longitud   
## resultante X (Pista: usar la ley de esperanzas iteradas).

# (a) Encontrar la expresión de E[X] en función de L.
#
# Sabemos que la esperanza iterada es:
# -----------------------------------
# E[E[X|Y]] = E[X]
#
# Siendo:
#
# Y ~ U[0,L] : Primer corte
# X ~ U[0,Y] : Segundo corte
#
# Ese Y de la segunda uniforme lo tomamos (en promedio) igual a la media de la
## primer uniforme, entonces Y = L/2
#
# Luego como E[E[X|Y]] = E[X], la esperanza para X, uniforme [0,L/2] será L/4
#
# Podríamos también escribir E[E[X|Y]]=E[Y/2]=1/2*E[Y] = 1/2*L/2 = L/4
#
# La varianza iterada queda definida como:
# ----------------------------------------
# var[E[X|Y]] = var[X] - E[var[X|Y]]
#
# var[E[X|Y]] = (E(X^2)-E^2(X)) - E(Y^2/12))
# var[E[X|Y]] = (L/8-L/16) - 1/12*(L/4))
# var[E[X|Y]] = L*(0.0625 - 0.02083)
# var[E[X|Y]] = L*0.0416667
#

# (d) Simulación con 1000 ensayos
#--------------------------------
L = 1;
n=1000;
primercorte = L*rand(1,n);
segundocorte = primercorte .* rand(1,n);
esperanzaiterada = mean(segundocorte);
varianzaiterada = var(segundocorte);

# Para una realización:
# La esperanza iterada me da L*03.2542 -> comprueba
# La varianza iterada me da L*0.0488 -> Comprueba

