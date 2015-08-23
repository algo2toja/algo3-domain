package ar.tp.dieta

class Condimento extends ElementoDeReceta{
	
	override soyInadecuadoParaCondicion(Condicion unaCondicion) {
		unaCondicion.ingredienteEsInadecuado(this)
	}
	
	override toString(){
		nombre
	}
}