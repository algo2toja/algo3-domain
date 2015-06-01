package ar.tp.dieta

interface ConsultaObserver {
	
	def void actualizar(Usuario usuario,Receta receta)
}