%%    Retorna los valores de x aproximado, de la soluci�n de Ax = b
%%
%%    parametros:
%%    No recibe ning�n parametro ya que se definen dentro de esta y vienen dados en el eunciado de esta tarea.
%%
%%    Llamado en consola:
%%    parte1_p2()
function xi = parte1_p2()
  #valores dados en el enunciado para calcular A
  p = [1:0.1:25];
  q = [1:0.1:25];
  m = 242;
  b = ones(m,1); 

  A = tridiagonal(p,q,m); #Calcular matriz A con funci�n tridiagonal ya implementada

  #valor inicial
  xi = zeros(m,1); #valor inicial para los Xi
  xi_1 = zeros(m,1); #valor inicial para los Xi+1

  #valores para condiciones de parada
  tol = 10^-5;
  iter_max = 1;
  c_parada = tol + 1;
  
  while (c_parada > tol && iter_max < 1000)
    
    for i = 1:m #for para ir calculando los Xi
      sumatoria = 0; #aqu� se ir� guardando el valor de la sumatoria de la ecuaci�n (1)
      #bi = b(i); #dado que los valores brindados para b sin 1 siempre, este valor siempre ser� un 1, independientemente de la posici�n
      #ya que los tiempos aumentan si se calcula con bi, por lo que se deja como 1 en el c�lculo del xi+1
      
      for j = 1:m
        if i != j #el c�lculo de la sumatoria se har� siempre que j no sea igual a i
          sumatoria += A(i,j)*xi(j); #Se hace la suma de la multiplicaci�n del A en la posici�n ij con el Xi
        endif
      endfor
      xi_1(i) = (1/A(i,i))*(1-sumatoria); #se sustituye el valor Xi+1 de los valores iniciales
      
    endfor
    c_parada = norm(A*xi-b); #se calcula la condici�n de parada para verificar con la tolerancia, este ser�a el error
    xi= xi_1; #se actualiza el valor Xi
    iter_max += 1; #se aumenta la iteraci�n, no debe pasar las 1000
    
    endwhile

  
endfunction