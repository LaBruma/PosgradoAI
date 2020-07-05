# ejercicio4
# Sea x = (X1;X2) € R2 un vector de v.a.
#(b) Definamos y = T(x), con T = (g1(x1; x2); g2(x1; x2)) € R2, con g1; g2      
## diferenciables
#(c) Encontrar la expresión de la pdf del vector transformado y en función de   
## fX1X2
#(d) Resolver la pdf de y para el caso del vector x del Ejercicio 2 con 
# T = [ 1 1; -1 1] y simular en Octave

# No tengo idea ni por donde empezar, pero calculo que es esto por ejemplo para
## uniformes:
X=rand(1000,2);
T = [ 1 1; -1 1]
Y= X*T;
figure;scatter(Y(:,1),Y(:,2))

# Y para la distribución del ejercicio 2 sería:
rho = 0.5;
sigmaX1 = 1 ;
sigmaX2 = 1/sqrt(2) ;
Cov = sigmaX1.^2 .* [sigmaX1.^2 rho*sigmaX1*sigmaX2; rho*sigmaX1*sigmaX2 sigmaX2.^2];

X = mvnrnd([0 0], Cov, 1000);
Y= X*T;
figure;scatter(Y(:,1),Y(:,2))