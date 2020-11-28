pkg load parallel;
%% Funcion que realiza el metodo iterativo de Jacobi 
%% del documento de forma paralela mediante el paquete parallel de octave
%% tiene como parametro el valor de n que es la cantidad de procesadores
%% disponibles en la pc a ejecutar

function xk = p1_p3(n)

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
    
    fun_handler=@(i) jacobi_aux(A,b,tmpXk, m,i);
    #el resultado de pararrayfun es un vector fila, necesitamos que sea columna por lo que utilizamos el operador de transpuesta
    tmpXk=pararrayfun(n,fun_handler,tmp).'; 
    k=k+1;
    error=norm(A*tmpXk-b);
  endwhile

  xk = tmpXk;

endfunction