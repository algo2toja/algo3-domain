package ar.tp.dieta

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class RutinaActiva extends Rutina {
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
		(tiempoDeEjercicio>30)
	}

}