package ar.tp.dieta

import ar.tp.dieta.Condicion

class CondicionVegano extends Condicion {
	//Lista de "elementos" que no son buenos para una condicion
	val String[] elementosNoRecomendables = #["pollo", "carne", "chivito", "chori"]

	override esVegano() {
		true
	}

	override seSubsana(Usuario unUsuario) {
		(unUsuario.meGustaLaFruta())
	}
	
	override validarCondicion(Usuario unUsuario){
		!(unUsuario.meGustaLaCarne())
	}

	override ingredienteEsInadecuado(ElementoDeReceta unElemento) {
		//Si entre los elementos no recomendables esta alguno de los contenidos de la receta.
		elementosNoRecomendables.contains(unElemento.getNombre())
	}
}