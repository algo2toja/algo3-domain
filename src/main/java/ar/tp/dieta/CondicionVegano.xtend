package ar.tp.dieta

import ar.tp.dieta.Condicion
import java.util.List

class CondicionVegano extends Condicion {
	//Lista de "elementos" que no son buenos para una condicion
	List<String> elementosNoRecomendables = #["pollo", "carne", "chivito", "chori", "lomo"]

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