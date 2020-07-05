% En una competencia se tienen 3 puertas de las cuales se debe elegir una. Dos  
## puertas tienen la foto de un chancho y la tercera tiene la foto de un        
## automóvil. Si el participante acierta la puerta del automóvil, lo gana. En   
## caso contrario, no gana nada. Una vez que el participante elige una puerta,  
## aún con todas las puerta cerradas, el organizador de la competencia - que    
## sabe en qué puerta se encuentra la foto del automóvil - abre una de las tres 
## puertas que tiene la foto de un chancho. >Qué le conviene hacer al           
## participante, cambiar su elección o no? Justificar usando probabilidad a     
## priori y probabilidad condicional.

# Definición de suscesos
# ----------------------
# 
# A: Elegir inicialmente la puerta del auto
# B: Elegir inicialmente la puerta del chancho
# G: Ganar el auto
#
# P(A) = 1/3  --> Probabilidad a priori
# P(B) = 2/3  --> Probabilidad a priori
# 
# Probabilidad de ganar (probabilidad total):
# -------------------------------------------
# P(G) = P(G/A).P(A) + P(G/B)P(B)
#
# Definimos dos casos
# -------------------
# 1- Jugador que cambia la puerta:
#
# P(G/A) = 0, P(G/B) = 1
#
# Entonces para este jugador: P(G)= 0*1/3 + 1*2/3 = 2/3
#
# 2- Jugador que no cambia la puerta:
#
# P(G/A) = 1, P(G/B) = 0
#
# Entonces para este jugador: P(G)= 1*1/3 + 0*2/3 = 1/3

# Conclusión: Conviene ser el tipo de jugador que cambia
