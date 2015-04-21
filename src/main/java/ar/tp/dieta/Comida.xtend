package ar.tp.dieta

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Comida {

	// asumimos que una comida (ingrediente) es no recomendable solamente para 1 condicion preexistente
	String nombre // Puede ser tanto un ingrediente como un condimento ya que todavia no hay una diferencia marcada. 
	double cantidad

	new(String unNombre, double unaCantidad) {
		nombre = unNombre
		cantidad = unaCantidad
	}

	def noRecomendableParaVeganos() {
		(nombre == "carne" || nombre == "chori" || nombre == "chivito" || nombre == "pollo")
	}

	def noRecomendableParaDiabeticos() {
		(nombre == "azucar" && cantidad >= 100)
	}

	def noRecomendableParaHipertensos() {
		(nombre == "sal" || nombre == "caldo")
	}

}