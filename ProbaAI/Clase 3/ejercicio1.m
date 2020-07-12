# Ejercicio 1
#============
#
# Juan y Pedro juegan un juego de dados en el cual el que tira el dado más alto  
## gana. Si ambos tiran el mismo número, tiran de nuevo hasta que uno gane. Juan
## ganó. Encontrar la probabilidad de que haya ganado con un 5. (Pista: listar  
## todos los pares de tiradas de Juan y Pedro en las que Juan gana, y encontrar 
## en cuáles gana con un 5)

# (a) Según lo visto en clase podemos armar la tabla
#
# Juan  |  Pedro
#   2        1
#   3        2,1
#   4        3,2,1
#   5        4,3,2,1
#   6        5,4,3,2,1
#
# P(x=5|ganó Juan) = 4/15
#

# (b) Simular un dado y encontrar una estimación de la probabilidad anterior

dadojuan = randi(6,1,1000);
dadopedro = randi(6,1,1000);

# La probabilidad que Juan gane con un 5 la podemos calcular a partir de la
## simulacion de dados como:
#-----------------------------
dadojuanigual5 = dadojuan == 5;
casosposibles = sum(dadojuan(dadojuanigual5) > dadopedro(dadojuanigual5));
casosfavorables = sum(dadojuan > dadopedro);
p = casosposibles/casosfavorables;

# Lo cual da (para una corrida en particular) 0.26877, muy cerca de 4/15 =
## 0,26666667
