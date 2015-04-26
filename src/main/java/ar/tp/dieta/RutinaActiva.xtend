package ar.tp.dieta

class RutinaActiva implements Rutina {
	int tiempoDeEjercicio
	
	override rutinaEsNula(){
		false
	}
	
	override rutinaEsLeve(){
		false
	}
	
	override rutinaEsMedia(){
		false
	}	
	
//Si la rutina no tiene ejercicio adicional o tiempoDeEjercicio<30 será sólo activa.
	override rutinaEsActiva(){
		true
	}
	
//Si la rutina tiene tiempoDeEjercicio>30 será intensiva.
	override boolean rutinaEsIntensiva() {
		tiempoDeEjercicio>30
	}

}