/**
 * @file Pseudoinversa.h
 * @version 1.0
 * @date 18/10/2020
 * @title Funciones Transcendentes
 */
#include <armadillo>

class Pseudoinversa
{
public:
	/** @brief Calcula la pseudoinversa de una matriz a
	* @param a matriz de la cual se desea obtener su pseudoinversa
	* @return retorna la pseudoinversa
	*/
	static arma::mat GetPseudoinversa(arma::mat a);
	/** @brief Crea la matriz de 45x35 donde cada valor ij es i^2 + j^2
	* @return retorna la matriz de 45x35 donde cada valor de ij es i^2 + j^2
	*/
	static arma::mat CreateMatrix();
private:
	/** @brief Condicion de parada para el calculo de la pseudoinversa
	* @param a matriz de la cual se desea obtener su pseudoinversa
	* @param x pseudoinversa calculada para la matriz a
	* @return retorna si se cumple con la condicion de parada
	*/
	static bool stop(arma::mat a, arma::mat x);
};

