package ar.tp.dieta

import ar.tp.dieta.Condicion

class CondicionDiabetes extends Condicion {

	override esDiabetes() {
		true
	}

	override seSubsana(Usuario unUsuario) {
		(unUsuario.rutinaEsActiva || unUsuario.getPeso <= 70
		)
	}

}