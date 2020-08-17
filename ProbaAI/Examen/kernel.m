# Defino el Kernel
function k = kernel(xk)
  k = 1/sqrt(2*pi)*exp(-xk.^2/2);
endfunction