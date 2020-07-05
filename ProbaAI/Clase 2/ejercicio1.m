# Ejercicio1
#Sean X; Y dos v.a. distribuidas normalmente, con distribucion conjunta normal  
## bivariable fXY . Demostrar que X;Y son independientes si y sólo si son v.a.  
## descorrelacionadas (pista: usar rho= 0 en fXY )
#
# Para la distribución conjunta normal bivariable XY se cumple:
#
# fXY (x,y) =
## 1/(2*pi*sigmaX*sigmaY*sqrt(1-rhoXY^2))*exp(-1/(2-2*rhoXY^2)*(ZX^2-2*rhoXY*Zx*ZY+ZY^2)
#
# En el caso que estén descorrelacionadas rhoXY = 0, entonces:
#
# fXY(x,y) = 1/(2*pi*sigmaX*sigmaY)*exp(-1/2*(ZX^2+ZY^2)
#
# Que se puede escribir como la multiplicación de dos distribuciones gaussianas
## independientes
#
# fXY(x,y) = fX(x) * fY(y) 
#
# Donde:
#
# fX(x) = 1/(sqrt(2*pi)*sigmaX)*exp(-1/2*Zx^2)
# fY(y) = 1/(sqrt(2*pi)*sigmaY)*exp(-1/2*Zy^2)
#
# Lo cual comprueba el enunciado.