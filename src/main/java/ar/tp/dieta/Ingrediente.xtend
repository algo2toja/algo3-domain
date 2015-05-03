package ar.tp.dieta

//Ingrediente integra tanto condimentos (sal,azucar, etc.) como ingredientes (carne, pollo, etc.)
class Ingrediente extends ElementoDeReceta{
	
	override soyInadecuadoParaCondicion(Condicion unaCondicion) {
		unaCondicion.ingredienteEsInadecuado(this)
	}
	
}