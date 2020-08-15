
# Ejercicio 3
#===============================
#
# En un concurso con 10 participantes, cada participante prueba una muestra de 3
# vasos de bebida. Dos de los 3 vasos contienen la misma bebida marca X, 
# mientras que el vaso restante contiene la bebida marca Y
#
# Queremos determinar si la gente realmente puede discriminar la bebida Y con un
# nivel de significancia de 5%.
#
# (a) Cu�l es la m�nima cantidad de personas que deben identificar la bebida Y 
# para concluir que, en general, la bebida Y es claramente identificable con 
# respecto a la bebida X?

# item(a)
#--------
#
# H0: p=1/3 --> Hip�tesis nula (no pueden discriminar)
# H1: p>1/3 --> Hip�tesis alternativa (pueden discriminar)
#
# alpha: 0.05 --> significancia
# 
# estad�stica de prueba: 
# 
# Tengo pocas muestras (N=10). Deber�a calcular a trav�s de una T-student
#
# t_alpha/2 = (mu_est - mu)/(s/sqrt(N))

# Para aprobar la hip�tesis alternativa debo rechazar la nula

p=1/3;          # Probabilidad de no darse cuenta (elegir cualquier vaso)
N=10;           # N�mero de personas en el experimento
mu_h0 = 1/3*N;  # Media seg�n la hip�tesis nula

# Para la significancia indicada el valor tabular nos da 2.2622:
t_alpha2 = tinv(1-0.025,N-1);

# Me queda la duda si no tendr�a que haber utilizado este, unilateral.
# t_alpha2 = tinv(1-0.05,N-1);

for k=N:-1:1
  # Calculo la probabilidad binomial variando el n�mero de personas que puede 
  # darse cuenta y los que no.
  p_binomial = nchoosek(N,k) * p^k * (1-p)^(N-k);
  
  # Calculo la media binomial
  mu_binomial = p_binomial*N;
  
  # Calculo la varianza binomial
  sigma2 = p_binomial*N*k;
  s = sqrt(sigma2);
  
  t_alpha2_hip = (mu_binomial - mu_h0)/(s/sqrt(N));
  
  res = abs(t_alpha2_hip) < abs(t_alpha2)
end

 # Los resultados indican que a partir de que 6 personas pueden identificar la 
 # bebida Y entro dentro del intervalo de confianza de la hip�tesis (95%)
 
 
 # Sal�a con esto...
 
 1-binocdf(6,10,1/3)
 
 