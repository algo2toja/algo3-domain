package ar.tp.dieta

interface ConsultaObserver {
	
	def void actualizar(Usuario usuario, String nombre, String dif)
	
}