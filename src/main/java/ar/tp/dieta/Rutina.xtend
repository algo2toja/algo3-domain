package ar.tp.dieta

abstract class Rutina {
	def rutinaEsNula(){
		false
	} 
	
	def rutinaEsLeve(){
		false
	}
	
	def rutinaEsMedia(){
		false
	}
	
	def rutinaEsActiva(){
		true
	}
	
	def rutinaEsIntensiva(){
		false
	}
	
}