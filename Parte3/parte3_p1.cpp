#include <iostream>
#include <armadillo>
#include "Pseudoinversa.h"
 
using namespace std;
using namespace arma;


int main()
{
	mat a = Pseudoinversa::CreateMatrix();

	cout << "Matrix: "<< endl << a << endl;

	a = Pseudoinversa::GetPseudoinversa(a);

	cout << "Transpose: " << endl << a << endl;
	
	return 0;
}

