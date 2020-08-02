pkg load statistics

normcdf(0.96)
normcdf()

tcdf()

tinv(0.98,199)

# Ejercicio 1
#===============================================================================
# Se toma una muestra aleatoria de la altura de 100 personas y se obtiene que  
# las altura promedio es 1.8m. La varianza de la población es sigma^2 = 49cm2.
#
# (a) Encontrar un intervalo de confianza de 95% para la altura media de la 
# población u
#
# (b) ¿Cómo cambiaría el desarrollo si se usara la varianza muestral?
#
# (c) Simular el ejercicio en Octave
#

# item (a)
#---------
# Usando el cambio de variable a Z podemos utilizar la normal [0,1]. Con lo cual
# para un intervalo de confianza del 95% obtenemos un z_alpha/2 de 1.96.

z_alpha2 = norminv(1-0.025);

# Luego, con la definición:
#
# P(u_est - 1.96 * sigma/sqrt(N) < u < u_est+1.96 * sigma/sqrt(N)) = 0,95
#
# Queda definido el intervalo:
#
# Inervalo de confianza (178.63; 181.37)

N = 100;
sigma = sqrt(49);
u_est = 180;

lim_izq = u_est-z_alpha2*sigma/sqrt(N);
lim_der = u_est+z_alpha2*sigma/sqrt(N);

# item (b)
#---------
# En este caso tendría que utilizar la T-student (con N-1 grados de libertad)
#
# t_alpha: t_alpha/2,N-1
#
# P(u_est - t_alpha * S/sqrt(N) < u < u_est + t_alpha * S/sqrt(N)) = 0,95
#
# Con lo cual queda definido el intervalo

# item (c)
#---------
pkg load statistics

randn('seed',1234)
n_sim = 200;
N_samples = 100;

u_est = 180;
sigma = sqrt(49);
lim_izq = u_est-z_alpha2*sigma/sqrt(N);
lim_der = u_est+z_alpha2*sigma/sqrt(N);

confianza = 0;

for i=1:n_sim
  # Generamos la variable aleatoria X (es como volver atrás desde el cambio de
  # variable a Z
  X=sigma/sqrt(N_samples)*randn(N_samples,1)+u_est;
  
  # Sumo todas las variables aleatorias que caigan dentro del intervalo 
  # (normalizado por la cantidad de muestras y la cantidad de iteraciones.
  confianza = confianza + (1/N_samples*sum(X>=lim_izq & X<=lim_der);
end

confianza_simulado = confianza/n_sim
confianza_teorico = 0.95