# Ejercicio 4
#===============================
#
# Un aviso publicitario asegura que 8 de cada 10 personas prefieren la pasta 
# dental marca Z
#
# (a) Hay suficiente evidencia para fundamentar esta hip�tesis con un 5% de 
# significaci�n? (N.B.: En t�rminos estad�sticos, la pregunta correcta ser�a si 
# el aviso es significativo)
#

# Dice 8 de cada 10 entonces:
mu = 8/10;

# No necesitar�a saber la poblaci�n (m�nimamente) y la varianza (quiz�s...)?
#
# Si tuviese la varianza entonces podr�a utilizar la normal en z [0,1]
#
# Este caso ser�a unilateral no?, m�s o menos de 8 eligen esa pasta.
z_alpha_2 = norminv(1-0.05);

# Siendo as� pedir�a (o verificar�a) que (mu_est - mu)/(sigma/sqrt(N)) est� 
# de mi intervalo definido por z_alpha_2. Considerando que la hip�tesis nula es
# que es verdadero (8 de cada 10 la eligen).
#
# Entonces si est� dentro del intervalo la acepto y si no la rechazo.
#
# En caso de no tener el desv�o lo tomo de mi poblaci�n y utilizo una t-student