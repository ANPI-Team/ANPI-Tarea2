#include "Pseudoinversa.h"
#include <armadillo>

#define ALPHA_0 5e-10;
#define ALPHA_1 2e-11;
#define TOLERANCE 1e-5;

arma::mat Pseudoinversa::GetPseudoinversa(arma::mat a)
{
	arma::mat xAnt = a.t() * ALPHA_0;
	arma::mat x = a.t() * ALPHA_1;

	bool stopCriterion = stop(a, x);

	while (!stopCriterion)
	{
		arma::mat xkMinus1 = xAnt;
		arma::mat xk = x;

		x = xkMinus1 + xk - xkMinus1 * a * xk;
		xAnt = xk;

		stopCriterion = stop(a, x);
	}

	return x;
}

bool Pseudoinversa::stop(arma::mat a, arma::mat x)
{
	double norm = arma::norm(a * x * a - a, "fro");
	return norm < TOLERANCE;
}


arma::mat Pseudoinversa::CreateMatrix()
{
	int maxI = 45;
	int maxJ = 35;
	arma::mat a(45, 35, arma::fill::zeros);

	for (int i = 0; i < maxI; i++)
		for (int j = 0; j < maxJ; j++)
			a(i, j) = pow(i+1, 2) + pow(j+1, 2);

	return a;
}