# Ejercicio 4
#===============================
#
# Un aviso publicitario asegura que 8 de cada 10 personas prefieren la pasta 
# dental marca Z
#
# (a) Hay suficiente evidencia para fundamentar esta hipótesis con un 5% de 
# significación? (N.B.: En términos estadísticos, la pregunta correcta sería si 
# el aviso es significativo)
#

# Dice 8 de cada 10 entonces:
mu = 8/10;

# No necesitaría saber la población (mínimamente) y la varianza (quizás...)?
#
# Si tuviese la varianza entonces podría utilizar la normal en z [0,1]
#
# Este caso sería unilateral no?, más o menos de 8 eligen esa pasta.
z_alpha_2 = norminv(1-0.05);

# Siendo así pediría (o verificaría) que (mu_est - mu)/(sigma/sqrt(N)) esté 
# de mi intervalo definido por z_alpha_2. Considerando que la hipótesis nula es
# que es verdadero (8 de cada 10 la eligen).
#
# Entonces si está dentro del intervalo la acepto y si no la rechazo.
#
# En caso de no tener el desvío lo tomo de mi población y utilizo una t-student