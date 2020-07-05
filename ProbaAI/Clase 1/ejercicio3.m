# item a
# Sean X; Y dos v.a. i.i.d. U[0; 1]. Encontrar la expresión de la función de    
## densidad de probabilidad conjunta.
#-------------------------------------------------------------------------------
#
# f(x,y)= 1/((1-0).(1-0) si x € [0,1], y € [0,1]
#
# o sea...f(x,y) = 1

# item b / d
# Cuál es la probabilidad de que X > 0,7 y Y < 0,4 simultaneamente?
#-------------------------------------------------------------------------------
# Es la integral 2D de esa área
#
# O sea: P(x>0.7, y<0.4)= 0.3 * 0.4 = 0.12

item_b = (1-unifcdf(0.7))*unifcdf(0.4);

# item c
# Cuál es el percentil 40 de X, i.e. x40?
#-------------------------------------------------------------------------------

x_40 = 1 * unifcdf(0.4);

# item e
# Graficar la cdf en función de x,y
#-------------------------------------------------------------------------------
[x,y]= meshgrid(0.1:0.1:2);

# Calculo para una dimensión (x o y) ya que son iguales
cdf = unifcdf([0.1:0.1:2]);

z = cdf' * cdf;

figure; surf(z)