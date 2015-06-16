package ar.tp.dieta

abstract class Rutina {
	
	def boolean rutinaEsNula()
	def boolean rutinaEsLeve()
	def boolean rutinaEsMedia()
	def boolean rutinaEsActiva()
	def boolean rutinaEsIntensiva()
	def boolean rutinaSaludable(Usuario unUsuario){
		(unUsuario.validarIMC && unUsuario.condicionesPreexistentes.empty) || (unUsuario.condicionesPreexistentes.forall[condicion | condicion.seSubsana(unUsuario)])
	}
}