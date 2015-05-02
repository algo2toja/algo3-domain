package ar.tp.dieta

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class RutinaSedentaria extends Rutina{
	int tiempoDeEjercicio
	
	override rutinaEsNula() {
		tiempoDeEjercicio.equals(0)
	}
	
	override rutinaEsLeve() {
		tiempoDeEjercicio<30
	}
	
	override rutinaEsMedia() {
		tiempoDeEjercicio>30
	}
	
	override rutinaEsActiva(){
		false
	}
	
	override rutinaEsIntensiva() {
		false
	}
	
}