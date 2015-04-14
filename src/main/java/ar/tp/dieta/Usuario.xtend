package ar.tp.dieta

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Usuario {
	protected double peso
	protected double altura
	
	def indiceDeMasaCorporal() {
		peso / (Math.pow(altura,2))
	}
}