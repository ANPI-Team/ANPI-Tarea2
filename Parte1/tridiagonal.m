%%    Retorna una matriz A formada según el enunciado de esta tarea
%%
%%    parametros:
%%    p: Valor inicial dado por [1:0.1:25], para formar el vector p que será utilizado para crear la matriz A, la cantidad de elementos de p debe ser de m-1
%%    q: Valor inicial dado por [1:0.1:25], para formar el vector q que será utilizado para crear la matriz A, la cantidad de elementos de p debe ser de m-1
%%    m: Valor para el tamaño de la matriz, debe ser mayor o igual a 3, la matriz será de mxm
%%
%%    tridiagonal([1:0.1:25],[1:0.1:25],242)
function A = tridiagonal(p,q,m)
  if (numel(q) != (m-1) || numel(p) != (m-1) || m < 3 )#verificar condiciones: m debe ser >= 3, len de p y q deben cumplir m-1
    disp("Los valores ingresador no cumplen con las condiciones esperadas:\nm debe ser >= 3\nlen de p y q deben cumplir m-1\n"); #error a retornar si no se cumplen las condiciones
  
  else
    a = zeros(m,m); #se crea la matriz de tamaño mxm con valores 0

    for i = 1:(m) #entra en la fila
      for j=1:(m) #entra en la columna
        
        if (i == j) #verifica si es una posición de diagonal
          if i == m #verifica si es la ultima posición de la matriz
            a(m,m) = 2*p(m-1); #2pm diagonal
            a(m,m-1) = p(m-1); #pm anterior a diagonal
            
          elseif i == 1 #verifica si es la primera posición de la matriz
            a(i,j+1) = q(1); #p1 siguiente de diagonal
            a(i,j) = 2*q(1); #2p1 diagonal
            
          else
            a(i,j) = 2*(p(i-1)+q(i)); #2(pi + qi) diagonal
            a(i,j-1) = p(i-1); #pi anterior a diagonal 
            a(i,j+1) = q(i); #qi siguiente de diagonal
            
          endif
        endif
        
      endfor
    endfor
    

    A = a; #Asignar "a" a la matriz A final, para que se retorne al finalizar
    
  endif  
  
endfunction