package ar.tp.dieta

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Ingrediente{
	
	int cantidad
	
	def boolean soyCarne(){
		false
	}
}