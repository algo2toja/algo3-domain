package ar.tp.dieta

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class IngredienteCarne extends Ingrediente{
	
	int cantidad
	
	override soyCarne(){
		true
	}
}