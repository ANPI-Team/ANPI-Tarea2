%%Funcion que se encarga de calcular el jacobi para el vector
%% xk entrante (una iteracion), es usado como funcion base para la ejecucion
%% paralela necesaria en el problema 3 del punto 1 de la tarea
%% A; Matriz diagonalmente dominante de mxm
%% b; Vector b
%% xk; vector que contiene los xk calculados en la iteración anterior
%% m; dimensiones de la matriz
%% i; x_i a calcular
%% iter; valor resultante x_i
function iter = jacobi_aux(A, b,xk, m,i)
  sum=0;
  for j=1:m
    if(j!=i)
      sum=sum+A(i,j)*xk(j);
    endif
  endfor
  iter=(1/A(i,i))*(b(i)-sum);
endfunction
