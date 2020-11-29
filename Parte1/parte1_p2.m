%%    Retorna los valores de x aproximado, de la solución de Ax = b
%%
%%    parametros:
%%    No recibe ningún parametro ya que se definen dentro de esta y vienen dados en el eunciado de esta tarea.
%%
%%    Llamado en consola:
%%    parte1_p2()
function xi = parte1_p2()
  #valores dados en el enunciado para calcular A
  p = [1:0.1:25];
  q = [1:0.1:25];
  m = 242;
  b = ones(m,1); 

  A = tridiagonal(p,q,m); #Calcular matriz A con función tridiagonal ya implementada

  #valor inicial
  xi = zeros(m,1); #valor inicial para los Xi
  xi_1 = zeros(m,1); #valor inicial para los Xi+1

  #valores para condiciones de parada
  tol = 10^-5;
  iter_max = 1;
  c_parada = tol + 1;
  
  while (c_parada > tol && iter_max < 1000)
    
    for i = 1:m #for para ir calculando los Xi
      sumatoria = 0; #aquí se irá guardando el valor de la sumatoria de la ecuación (1)
      #bi = b(i); #dado que los valores brindados para b sin 1 siempre, este valor siempre será un 1, independientemente de la posición
      #ya que los tiempos aumentan si se calcula con bi, por lo que se deja como 1 en el cálculo del xi+1
      
      for j = 1:m
        if i != j #el cálculo de la sumatoria se hará siempre que j no sea igual a i
          sumatoria += A(i,j)*xi(j); #Se hace la suma de la multiplicación del A en la posición ij con el Xi
        endif
      endfor
      xi_1(i) = (1/A(i,i))*(1-sumatoria); #se sustituye el valor Xi+1 de los valores iniciales
      
    endfor
    c_parada = norm(A*xi-b); #se calcula la condición de parada para verificar con la tolerancia, este sería el error
    xi= xi_1; #se actualiza el valor Xi
    iter_max += 1; #se aumenta la iteración, no debe pasar las 1000
    
    endwhile

  
endfunction