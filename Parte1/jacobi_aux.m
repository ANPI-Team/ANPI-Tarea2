%%Funcion que se encarga de calcular el jacobi para el vector
%% xk entrante (una iteracion), es usado como funcion base para la ejecucion
%% paralela necesaria en el problema 3 del punto 1 de la tarea
function iter = jacobi_aux(A, b,xk, m,i)
  sum=0;
  for j=1:m
    if(j!=i)
      sum=sum+A(i,j)*xk(j);
    endif
  endfor
  iter=(1/A(i,i))*(b(i)-sum);
endfunction