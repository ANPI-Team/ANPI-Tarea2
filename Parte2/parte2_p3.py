from sympy import *
import matplotlib.pyplot as plt 
from parte2_p2 import *

def test_a():
    x = 'x_1 x_2'
    x_1 = symbols('x_1')
    x_2 = symbols('x_2')
    f0 = exp(x_1**2) - exp(sqrt(2)*x_1)
    f1 = x_1 - x_2
    f  = [ f0 , f1 ]
    x0 = [ 1.8 , 1.8 ]
    tol = 10**(-16)
    iterMax = 100
    print(newton_raphson(x0, f, x, tol, iterMax))

def test_b():
    x = 'x_1 x_2'
    x_1 = symbols('x_1')
    x_2 = symbols('x_2')
    f0 = x_1 + exp(x_2) - cos(x_2)
    f1 = 3*x_1 - x_2 - sin(x_2)
    f  = [ f0 , f1 ]
    x0 = [ 1.5 , 2 ]
    tol = 10**(-16)
    iterMax = 100
    print(newton_raphson(x0, f, x, tol, iterMax))

def test_c():
    x = 'x_1 x_2'
    x_1 = symbols('x_1')
    x_2 = symbols('x_2')
    f0 = x_1**2 - 2*x_1 - x_2 + 0.5
    f1 = x_1**2 + 4*x_2**2-4
    f  = [ f0 , f1 ]
    x0 = [ 3 , 2 ]
    tol = 10**(-16)
    iterMax = 100
    print(newton_raphson(x0, f, x, tol, iterMax))

def test_d():
    x = 'x_1 x_2'
    x_1 = symbols('x_1')
    x_2 = symbols('x_2')
    f0 = x_1**2 + x_2**2 - 1
    f1 = x_1**2 - x_2**2 + 0.5
    f  = [ f0 , f1 ]
    x0 = [ 0.7 , 1.2]
    tol = 10**(-16)
    iterMax = 100
    print(newton_raphson(x0, f, x, tol, iterMax))

def test_e():
    x = 'x_1 x_2'
    x_1 = symbols('x_1')
    x_2 = symbols('x_2')
    f0 = sin(x_1) + x_2*cos(x_1) 
    f1 = x_1 - x_2
    f  = [ f0 , f1 ]
    x0 = [ 1.2 , -1.5]
    tol = 10**(-16)
    iterMax = 100
    print(newton_raphson(x0, f, x, tol, iterMax))


test_c()
test_d()
test_e()
#test_a()
#test_b()