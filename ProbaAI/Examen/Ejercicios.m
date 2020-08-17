#==========================================
# Examen Final - Andrés Francisco Brumovsky
#==========================================


pkg load statistics

#============
# Ejercicio 1
#============

% Implementamos una binomial
%===========================

# item (a)
#---------
p_falla = 0.01; # Probabilidad de falla de la máquina

for n = 1:1000
  p_1_o_mas_defectuosos = 0;
  for k = 1:n 
    p = nchoosek(n, k) * p_falla^k * (1-p_falla)^(n-k);
    p_1_o_mas_defectuosos = p_1_o_mas_defectuosos+p;
  endfor
  
  if p_1_o_mas_defectuosos >= 0.5
    printf("La caja debe ser de  %d fósforos\n", n)
    break
  end
  
endfor

# item (b)
#---------
n=68;
esperanza = n*p_falla;
varianza = n*p_falla*(1-p_falla);

#item (c)
#--------

% numero de ensayos
N = 5000;
# número de fósforos por caja
n=68;

% numero de defectuosos, vale 1 cuando es ceca
n_defectuosos_vector = zeros(N,1);

% hacemos N ensayos, en cada ensayo tiramos la moneda 10 veces
% y vemos si al menos 3 es ceca
for i = 1:N

  % 68 sacadas por ensayo (todos los de la caja)
  for j = 1:n

    if(rand() < p_falla)
      n_defectuosos_vector(i) = n_defectuosos_vector(i) + 1;
    end

  end

end

% media muestreal
media_muestral = sum(n_defectuosos_vector) / N

% varianza muestral
varianza_muestral = (1/(N-1)) * sum((n_defectuosos_vector - media_muestral * ones(N,1)).^2)

#============
# Ejercicio 2
#============

# Item d)
#--------

# Semilla inicial
rand('seed',123);

# Numero de simulaciones
N=1000;

# Genero variables aleatorias uniformes
U=rand(N,1)

# Genero la variable aleatoria pedida
Y = sqrt(9*U);

# Cantidad de simulaciones de la variable independiente
n=1000;

# Genero el vector de 'x' con el que recorro
x=[-0.1:0.01:3.2];

# pdf
h = 0.2;
n=length(Y);
pdf = zeros(1,length(x));
for idx=1:n
  xk = (Y(idx)-x)/h;
  pdf = pdf + kernel(xk);
end
pdf = 1/(n*h)*pdf;

figure;
stem(x,pdf)
title('PDF de X')
ylabel('f_X(x)')
xlabel('x')
legend('Kernel Gaussiano - h = 0.2')
grid on

#============
# Ejercicio 3
#============

# Item (a)
#--------

N = 10;
sigma = 4;
u_est = 48;
z_alpha_div2 = 1.96;

lim_izq = u_est-z_alpha_div2*sigma/sqrt(N);
lim_der = u_est+z_alpha_div2*sigma/sqrt(N);

# Item (b)
#---------
u_0 = 45.5208;

Z = (u_est-u_0)/(sigma/sqrt(N));

# Item (c)
#---------

# Intervalo de confianza
#-----------------------

randn("seed", 1234)

% número de simulaciones que queremos correr
n = 200;

% número de muestras del proceso que tenemos
N = 10;

% media muestral (dato)
mu = 48;

% dispersion (dato)
sigma = 4;

% el intervalo de confianza de 95% teorico es:
mu_min_teorico = mu - 1.96*sigma/sqrt(N);
mu_max_teorico = mu + 1.96*sigma/sqrt(N);

% nivel de confianza del intervalo
confianza = 0;

for i=1:n

    % Generamos la distribucion en función de la media muestreal
    X = sigma/sqrt(N)*randn(N,1) + mu;

    % Verificamos cuántos valores están en el intervalo de confianza
    confianza = confianza + (1/(n*N)) * sum(X>=mu_min_teorico & X<=mu_max_teorico);

end

% estimacion del intervalo de confianza
confianza_simulado = confianza
confianza_teorico = 0.95

# Hipótesis nula
#---------------

randn("seed", 1234)

% número de simulaciones que queremos correr
n = 200;

% número de muestras del proceso que tenemos
N = 10;

% media muestral (dato)
mu = 48;

% media hipótesis nula
mu_h0 = 45;

% dispersion (dato)
sigma = 4;

% el intervalo de confianza de 95% teorico es:
mu_min_teorico = mu - 1.96*sigma/sqrt(N);
mu_max_teorico = mu + 1.96*sigma/sqrt(N);

% nivel de confianza del intervalo
confianza = 0;

for i=1:n

    % Generamos la distribucion en función de la hipótesis nula
    X = sigma/sqrt(N)*randn(N,1) + mu_h0;

    % Verificamos cuántos valores caen en el intervalo de confianza
    confianza = confianza + (1/(n*N)) * sum(X>=mu_min_teorico & X<=mu_max_teorico);

end

% Muestras que caerían en el intervalo
muestras_en_el_intervalo = confianza
muestras_minimas_requeridas = 0.5