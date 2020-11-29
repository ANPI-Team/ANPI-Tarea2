%% Funcion que realiza el metodo iterativo de Jacobi 
%% del documento de forma paralela mediante el paquete parallel de octave
%% n; Cantidad de procesadores que se usarán para ejecutar
%% xk; Vector columna resultante
function xk = parte1_p3(n)
  pkg load parallel
  m=242;
  tmpXk=zeros(m,1);
  b=ones(m,1);
  tol=10e-5;
  error=tol+1;
  k=0;
  p=q=[1:0.1:25];
  tmp = 1:m;
  A=tridiagonal(p,q,m);

  while(error>tol)&& (k<1000)
    
    t_fun=@(i) jacobi_aux(A,b,tmpXk, m,i);
    #el resultado de pararrayfun es un vector fila, necesitamos que sea columna por lo que utilizamos el operador de transpuesta
    tmpXk=pararrayfun(n,t_fun,tmp).'; 
    k=k+1;
    error=norm(A*tmpXk-b);
  endwhile

  xk = tmpXk;

endfunction
