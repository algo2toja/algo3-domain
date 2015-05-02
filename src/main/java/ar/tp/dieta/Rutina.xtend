package ar.tp.dieta

abstract class Rutina {
	
	def boolean rutinaEsNula()
	def boolean rutinaEsLeve()
	def boolean rutinaEsMedia()
	def boolean rutinaEsActiva()
	def boolean rutinaEsIntensiva()
	def boolean rutinaSaludable(Usuario unUsuario){
		((unUsuario.indiceDeMasaCorporal >= 18 && unUsuario.indiceDeMasaCorporal <= 30 && unUsuario.condicionesPreexistentes.empty )|| unUsuario.condicionesPreexistentes.exists[condicion | !condicion.seSubsana(unUsuario)])
	}
}