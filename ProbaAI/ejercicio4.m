# item a
# Sean X; Y dos v.a. i.i.d. N[0; 1]. Encontrar la expresi�n de la funci�n de    
## densidad de probabilidad conjunta.
#-------------------------------------------------------------------------------
#
# Gen�ricamente para normales x,y:
#
# f(x,y)=(1/(2*pi*sigm_x*sim_y)*exp(-1/2 *
## ((x-mu_x)^2/(sigm_x)^2+(y-mu_y)^2/(sigm_y)^2))
#
# Pero como son Normales [0;1]
#
# f(x,y)=(1/(2*pi)*exp(-1/2 *(x^2+y^2))
#

# item b / d
# Cu�l es la probabilidad de que X > 0,7 y Y < 0,4 simultaneamente?
#-------------------------------------------------------------------------------
# Es la integral 2D de esa �rea

item_b = (1-normcdf(0.7))*normcdf(0.4);

# item e
# Graficar la cdf en funci�n de x,y
#-------------------------------------------------------------------------------
[x,y]= meshgrid(-3:0.1:4);

# Calculo para una dimensi�n (x o y) ya que son iguales
cdf = normcdf([-3:0.1:4]);

z = cdf' * cdf;

figure; surf(z)