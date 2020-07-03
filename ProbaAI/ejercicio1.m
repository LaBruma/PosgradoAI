%- ítem (a)
% Cuál es la probabilidad de obtener exactamente 3 cecas en 10 tiradas de una   
## moneda balanceada?
%-------------------------------------------------------------------------------
% Implementamos la binomial
p_cara = 0.5;
p_ceca = 0.5;
n=10;
k=3;

p_item_a = nchoosek(n, k) * p_ceca^k * p_cara^(n-k);

%- ítem (b)
% ¿Cuál es la probabilidad de obtener al menos 3 cecas en 10 tiradas de una     
## moneda cargada donde la probabilidad de ceca es 0.4?
%-------------------------------------------------------------------------------

p_ceca = 0.4;
p_cara = 1-p_ceca;

% Calculo las probabilidades binomiales de 0 a 2
for k = 0:2
  P(k+1) =  nchoosek(n, k) * p_ceca^k * p_cara^(n-k);
endfor

p_item_b = 1-sum(P);

% item c
%Una moneda cargada con probabilidad de ceca 0.4 es arrojada al aire. El        
## resultado es cara. Cuál es la probabilidad de obtener al menos 3 cecas en las
## próximas 10 tiradas?
%-------------------------------------------------------------------------------

% Calculo las probabilidades binomiales de 0 a 2
for k = 0:2
  P(k+1) =  nchoosek(n, k) * p_ceca^k * p_cara^(n-k);
endfor

# Acá hay que usar la probabilidad condicional, pero las probabilidades son
## independientes. No altera que haya salido cara a lo que vaya a ocurrir con
## las 10 tiradas que siguen
#-------------------------------------------------------------------------------

p_item_c = (1-sum(P));

% item d
% Simular los items anteriores en Octave usando: i) una distribución uniforme   
## con la función rand para simular el proceso Bernoulli; ii) las funciones     
## binopdf,binocdf para calcular la probabilidad binomial (Octave statistics    
## package).
%-------------------------------------------------------------------------------

# i. Uniforme (50%/50%....solo ítem a)
#-------------------------------------
x = round(rand(1000,10)); # Generamos 1000 experimentos de 10 tiradas c/u
xs = sum(x,2);

#item a
p_item_a_i = sum(xs==3)/length(xs);

# ii
# ------

% item a
%-------
p_item_a_ii = binopdf(3, 10, 0.5);

% item b
%-------
p_item_b_ii = 1 - binocdf(3, 10, 0.5);



