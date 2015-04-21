package ar.tp.dieta

import ar.tp.dieta.Rutina

class RutinaNula extends Rutina {
	override rutinaEsNula() {
		true
	}

	override rutinaEsActiva() {
		false
	}

}