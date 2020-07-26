# Se tira una moneda 100 veces, y salen 55 cecas
#
#(a) Encontrar el estimador de máxima verosimilitud de la probabilidad de ceca p
#
#(b) Simular el experimento y encontrar por computadora el valor de la          
## estimación de máxima verosimilitud de p.
#

# (a) La probabilidad de una función binomial se puede calcular (para igual
## probabilidad de ocurrencia del suceso) como
#
#  pr(k|n,p) = nchoosek(n, k) * p^k * (1-p)^(n-k)
#
# Podemos reordenar esta ecuación para escribir la verosimilitud (L: likelihood)
#
# L(p|n,k) = nchoosek(n, k) * p^k * (1-p)^(n-k)
#
# En la cual mantenemos fijos los parámetros k y n y podemos variar el p. Luego
## podemos encontrar la máxima verosimilutud derivando esta ecuación y
## encontrando el máximo, pero es más fácil hacerlo sobre la función con el
## logaritmo aplicado:
#
# ln(L(p|n,k)) = ln(nchoosek(n, k) * p^k * (1-p)^(n-k))
# ln(L(p|n,k)) = ln(nchoosek(n, k)) + k*ln(p) + (n-k)*ln(1-p)
#
# d(ln(L(p|n,k)))/dp = 0 + k * (1/p) - (n-k)*1/(1-p)
#
# Igualando la derivada a cero
#
# k * (1/p) - (n-k)*1/(1-p) = 0
# k * (1-p) - (n-k) * p = 0
# k - k*p - n*p + k*p = 0
# k = n*p
# p = k/n
# 
# Lo cual es bastante loco. No necesito calcular nada para obtener la máxima
## verosimilitud más que k y n.

n=100;
k=55;
idx=1;
for p=0:0.01:1
  p^k * p^(n-k)
  likelihood_n_k(idx) = nchoosek(n,k) * p^k * (1-p)^(n-k);
  idx = idx+1;
endfor

x = [0:0.01:1];

# El máximo de esta función está en:
[~,pos] = max(likelihood_n_k)
Max_likelihood = pos/(length(x)-1);

# Dibujo
figure;plot(x,likelihood_n_k)
title('Curva de verosimilitud')
legend(['Máxima verosimilitud=',num2str(Max_likelihood)])
