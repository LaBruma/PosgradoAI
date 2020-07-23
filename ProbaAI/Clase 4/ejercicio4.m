#Repetir el ejercicio 3 usando un estimador de kernel con una función de Kernel
## con una función Gaussiana
#
# Comparar resultados entre ambos ejercicios

# Genero las muestras
xi=randn(1,10000);

# Genero el vector de 'x' con el que recorro
x=[-3:0.01:3];

# pdf
h = 2;
n=length(xi);
pdf = zeros(1,length(x));
for idx=1:n
  xk = (xi(idx)-x)/h;
  pdf = pdf + kernel(xk);
end
pdf = 1/(n*h)*pdf;

figure;
stem(x,pdf)

# Es muchísimo más suave con este método. Aunque bastante dependiente del h
## (ancho del filtro). Con h=0.5 anda joya. Con h=0.1 ya se empieza a ver mal.  
## Con h=0.05 se aprecia la reconstrucción deficiente de la gaussiana original  
## (de donde vienen las muestras).

# Por otro lado si el h es muy grande se ve el efecto contrario. Ya con h=1 la
## reconstrucción devuelve una gaussiana más ancha que la que debería tener
## según la distribución de origen de las muestras. Con h=2 es mucho peor
## (realmente inaceptable).