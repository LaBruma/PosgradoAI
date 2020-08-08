# TP: FILTRO DE KALMAN
# ====================

#=============================
# CARGA DE LOS DATOS PROVISTOS
#=============================
pos = load('posicion.dat');
vel = load ('velocidad.dat');
acc = load('aceleracion.dat');

n = length(pos); # Tama�o de las muestras disponibles

# Nota: La primer columna de cada variable es siempre el indicador de tiempo de 
# medici�n (una medici�n por segundo)

# La idea entonces es armar un modelo de actualizaci�n en el que conformamos un
# vector de 9x1 con la posici�n, velocidad y aceleraci�n. De esta manera:
#
# X es de 9x1
# A es de 9x9
# B es de 9x9 (matriz identidad)
#
# Adem�s, con:
#
# a_n+1 = a_n + psi_a
# v_n+1 = v_n + T * a_n + psi_v
# p_n+1 = p_n + T * v_n + T^2/2 * a_n + psi_p
#
# Donde:
#
# T: per�odo de muestreo
# psi_a,psi_v,psi_p : Ruido
#

#=========================
# CONFORMACI�N DE MATRICES
#=========================

# La matriz A, para este problema, queda determinada entonces seg�n:
#-------------------------------------------------------------------
T = 1; # Per�odo de muestreo 1 segundo

A = [eye(3),T*eye(3),T^2/2*eye(3);...
     zeros(3),eye(3),T*eye(3);...
     zeros(3),zeros(3),eye(3)];

# La matriz B es simplemente la identicas (suponemos independencia entre los
# ruidos de los instrumentos para posici�n, velocidad y aceleraci�n
#------------------------------------------------------------------
B = eye(9); 

# La matriz C queda definida a partir que sabemos que �nicamente contamos con
# los datos de posici�n del sensor (posiblemente un GPS)
#-------------------------------------------------------
C = [eye(3),zeros(3),zeros(3)];

#==============================
# DATOS INICIALES SUMINISTRADOS
#==============================
     
# estado inicial, covarianza inicial, matriz de covarianza del ruido
#-------------------------------------------------------------------
x_0_0 = [10.7533; 36.6777; -45.1769; 1.1009; -17.0; 35.7418; -5.7247; 3.4268; 5.2774];
P_0_0 = diag([100, 100, 100, 1, 1, 1, 0.01, 0.01, 0.01]);
Q = 0.3*(eye(9));

#==========================
# RUIDO PARA LAS MEDICIONES
#==========================

caso=1;
#caso=2;
#caso=3;

switch(caso)
  case 1
    #-------------------------------------------------
    # CASO 1: Ruido blanco gaussiano sobre la posici�n
    #-------------------------------------------------
    desvio = 10;
    R = desvio^2 * eye(3); # Surge a partir del ruido considerado
    
    # Repito la definici�n de C solo porque el caso 3 la pisa
    #--------------------------------------------------------
    C = [eye(3),zeros(3),zeros(3)];

    # Agrego ruido a los datos de posici�n
    #-------------------------------------
    y_new = [pos(:,2:end) + desvio * randn(n,3)];

  case 2  
    #------------------------------------------------
    # CASO 2: Ruido blanco uniforme sobre la posici�n
    #------------------------------------------------
    desvio = 10;
    R = desvio^2 * eye(3); # Surge a partir del ruido considerado
    
    # Repito la definici�n de C solo porque el caso 3 la pisa
    #--------------------------------------------------------
    C = [eye(3),zeros(3),zeros(3)];
    
    # Agrego ruido a los datos de posici�n
    #-------------------------------------
    
    # Hay que tener en cuenta que una distribuci�n uniforme [0,1] puede
    # modificarse seg�n:
    #
    # a+(b-a)*rand() lo cual dar� una nueva distribuci�n con:
    #
    # media: (b+a)/2
    # varianza: (b-a)^2/12
    #
    # Dado que nosotros queremos media=0, varianza=100 (10^2). Resultan:
    #
    # b = -a
    # a = -17.32
    #
    # Entonces:
    
    y_new = [pos(:,2:end) + ((-17.32)+(34.64)*rand(n,3))];
  case 3
    #----------------------------------------------------------------
    # CASO 3: Ruido blanco gaussiano sobre la posici�n y la velocidad
    #----------------------------------------------------------------
    desvio_pos = 10;
    desvio_vel = 0.2;

    # Hay dos desv�os, cambia la matriz R
    #------------------------------------
    var_pos = desvio_pos^2;
    var_vel = desvio_vel^2;
    R = diag([var_pos,var_pos,var_pos,var_vel,var_vel,var_vel]); # Surge a partir del ruido considerado

    # Tengo que cambiar el C para considerar m�s informaci�n sensada
    #---------------------------------------------------------------
    C = [eye(6),zeros(6,3)];

    # Agrego ruido a los datos de posici�n y velocidad
    #-------------------------------------------------
    y_new = [pos(:,2:end) + desvio_pos * randn(n,3), vel(:,2:end) + desvio_vel * randn(n,3)];
endswitch

#====================================
# IMPLEMENTACI�N DEL FILTRO DE KALMAN
#====================================

# Inicializo con los datos brindados
#-----------------------------------
X_old_old = x_0_0; # E(x_0)
P_old_old = P_0_0; # Cov(X_0)

for i=1:n
  # Recursi�n sobre los par�metros del filtro
  # -----------------------------------------
  X_new_old = A * X_old_old; 
  P_new_old = A * P_old_old * A' + B * Q * B'; # Usamos solo traspuesta porque son reales
  K_new = P_new_old * C' * inv(C * P_new_old * C' + R);
  
  # Ahora s� estamos listos para calcular la nueva predicci�n en base al dato
  # anterior y la nueva entrada del sensor:
  #--------------------------------------------------------------------------
  X_new_new = X_new_old + K_new * (y_new(i,:)' - C * X_new_old);
  
  X_estimado(i,:) = X_new_new'; # Solo a fines de graficaci�n y an�lisis de datos
  
  # Actualizaci�n de par�metros
  #----------------------------
  X_old_old = X_new_new;
  P_old_old = (eye(9) - K_new * C) * P_new_old; # En realidad es P_new_new...pero la utilizaremos reci�n en el pr�ximo paso, cuando ya va a ser P_old_old 
end

#==================
# AN�LISIS DE DATOS
#==================

# Chequeo por el error cuadr�tico medio
#--------------------------------------
err_pos = sum(sqrt(sum((pos(:,2:end) - X_estimado(:,1:3)).^2,2)))/n;
err_vel = sum(sqrt(sum((vel(:,2:end) - X_estimado(:,4:6)).^2,2)))/n;
err_acc = sum(sqrt(sum((acc(:,2:end) - X_estimado(:,7:9)).^2,2)))/n;

#=========
# GR�FICOS
#=========
figure; plot(pos(:,2:end),'.-')
legend('Pos_X','Pos_Y','Pos_Z')
hold on
plot(X_estimado(:,1:3),'--')
title('Ruido Normal - Sensor de posicion y velocidad')

figure; plot(vel(:,2:end),'.-')
legend('Vel_X','Vel_Y','Vel_Z')
hold on
plot(X_estimado(:,4:6),'--')
title('Ruido Normal - Sensor de posicion y velocidad')

figure; plot(acc(:,2:end),'.-')
legend('Acc_X','Acc_Y','Acc_Z')
hold on
plot(X_estimado(:,7:9),'--')
title('Ruido Normal - Sensor de posicion y velocidad')

#=============
# CONCLUSIONES
#=============

# En relaci�n a las gr�ficas y a la evaluaci�n del error cuadr�tico medio 
# podemos decir que:
#
# Para los casos I (ruido normal) y II (ruido uniforme) no parece haber
# diferencias sustanciales en los resultados. Para ambos casos los errores
# cuadraticos est�n (en promedio) alrededor de:
#
# error_pos = 11.5
# error_vel = 4.5
# error_acc = 0.9
#
# Para el caso III (agregando el sensado de velocidad) el error de seguimiento
# de la velocidad mejora mucho como era presumible, pero tambi�n hay una mejora
# en el seguimiento de posici�n y aceleraci�n. Los valores promedio para estos
# errores en este caso est�n alrededor de:
#
# error_pos = 3.6
# error_vel = 0.3
# error_acc = 0.25
#

#=====
# DUDA
#=====
# La matriz de covarianza P_0_0 indicada tiene valor 100 para las primeras 
# componentes (de posici�n). Estimo que esto tiene que ver con la incerteza que
# tenemos en su determinaci�n dado nuestro m�todo de medici�n (sensor GPS) que 
# justamente tiene una varianza de 100.
# 
# Entonces, en rigor, al considerar el caso III, �no deber�amos tener otro P_0_0
# que tenga en las componentes para la velocidad el valor 0.04 que ser�a la
# varianza para ese dato?. De hecho...�por qu� tiene valores 1 y 0.01 en los
# casos iniciales?