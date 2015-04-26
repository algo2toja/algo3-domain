package ar.tp.dieta

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class IngredienteCarne implements Ingrediente{
	
	int cantidad
	
	override soyCarne(){
		true
	}
}