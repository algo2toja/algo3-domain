package ar.tp.dieta

import ar.tp.dieta.Condicion

class CondicionCeliaco extends Condicion {

	override esCeliaco() {
		true
	}
	
	override ingredienteEsInadecuado(ElementoDeReceta unElemento) {
		false
	}
		
}