# Ejercicio 1
#============

p = 0.4;
n=100;
k=3;

p_item_a = nchoosek(40, 2) * nchoosek(60, 1)/nchoosek(100, 3);

rand('seed',1234);

n=1000; #
N_tickets = 100;
N_premios = 40;

Y=0;
tickets = [ones(N_premios,1);zeros(N_tickets-N_premios,1)];
tickets = tickets(randperm(length(tickets))); # No del todo necesario

# Cantidad de experimentos
for i=1:n
  X=0;
  
  for j= 1:3
    X = X + tickets(randi(100));
  endfor
  
  if(X==2)
    Y=Y+1;
  end

endfor

P_ganar2premios = Y/n