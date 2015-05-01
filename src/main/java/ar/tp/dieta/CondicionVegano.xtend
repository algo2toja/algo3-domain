package ar.tp.dieta

import ar.tp.dieta.Condicion

class CondicionVegano extends Condicion {
	override esVegano() {
		true
	}

	override seSubsana(Usuario unUsuario) {
		(unUsuario.meGustaLaFruta())
	}
	
	override validarCondicion(Usuario unUsuario){
		!(unUsuario.preferencias.exists[comida | comida == "chori" || comida == "chivito" || comida == "pollo" || comida == "carne"])
	}
}