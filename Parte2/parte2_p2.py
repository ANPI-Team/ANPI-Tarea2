from sympy import *
import matplotlib.pyplot as plt 


def newton_raphson(x0, f, x, tol, iterMax):
    """
    Este método contiene la implementación del algoritmo Newton Raphson
    para la solución de sistemas de ecuaciones con múltiples variables. 
    Realiza la aproximación de las variables por medio de la siguiente 
    ecuación:

            x(k+1) = xk - Jinv(xk)*F(xk)

    Donde:
        F      = vector de funciones
        Jinv   = inverso de la matriz jacobiana de F
        xk     = vector de la aroximación actual
        x(k+1) = nueva aproximación 

    Para obtener el valor de la aproximación se resuelve primero el siguiente
    sistema de ecuaciones lineales:

            J(xk)y = -F(xk)
    
    Esto por medio del método LU que tiene sympy. Una vez calculado el vector
    'y' se suma a xk para realizar la aproximación.

    Parámetros:

        x0      -- vector con los valores iniciales de las variables
        f       -- lista con las funciones a evaluar 
        x       -- vector con las variables      
        tol     -- tolerancia debe ser mayor a 0
        iterMax -- número máximo de iteraciones 

    Devuelve:
        
        xk      -- vector con los valores de la aproximación 
        ek      -- error asociado a la aproximación 
        k       -- número de iteraciones que procesó
    
    """
    x           = symbols(x)
    xk          = Matrix(x0) 
    k           = 0
    ek          = 1
    f           = Matrix(f)
    J           = f.jacobian(x)
    xk_results  = []
    k_results   = []

    while tol < ek and k < iterMax :
        A       = J.subs([(x[0], xk[0]), (x[1], xk[1])]) 
        b       = -f.subs([(x[0], xk[0]), (x[1], xk[1])]) 
        y       = Matrix(2, 1, symbols('y1 y2')) 
        y_res   = A.LUsolve(b)
        xk      = y_res + xk
        ek      = abs(f.subs([(x[0], xk[0]), (x[1], xk[1])]).norm())
        xk_results.append(ek)
        k_results.append(k)
        k += 1

    plt.plot(k_results, xk_results) 
    plt.xlabel('Número de iteración') 
    plt.ylabel('Error de la aproximación') 
    plt.title('Aproximación vs iteración') 
    plt.show() 
    return (xk, ek, k)

