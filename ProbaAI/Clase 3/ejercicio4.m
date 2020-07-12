# ejercicio 4
#============
#
#Sea un proceso AWGN y(n) = 2 + w(n) donde w(n) ~ N(0; 1)
# Estimar la media y varianza de y(n) usando los siguientes estimadores:
# (a) y = 1/N*sum(y(i))
# (b) sn = 1/N*sum((y(i)-y)^2)
# (c) sn1 = 1/(N-1)*sum((y(i)-y)^2)
# (d) Calcular la esperanza de cada estimador
# (g) Simular con N=10 y N=10000
# (h) Interpretar los valores de sn; sn1 en cada caso. ¿Cuál es mejor?

# AWGN: Additive White Gaussian Noise

# Para 10 muestras
n=10;
yn= 2+randn(1,n); # ruido blanco gaussiano

#(a)
ymean = (1/n)*sum(yn);
#(b)
sn = (1/n)*sum((yn-ymean).^2);
#(c)
sn1 = (1/(n-1))*sum((yn-ymean).^2);

# Para 10000 muestras
n=10000;
yn= 2+randn(1,n); # ruido blanco gaussiano

#(a)
ymean = (1/n)*sum(yn);
#(b)
sn = (1/n)*sum((yn-ymean).^2);
#(c)
sn1 = (1/(n-1))*sum((yn-ymean).^2);

#sn1 es mejor estimador cuando hay pocas muestras.
