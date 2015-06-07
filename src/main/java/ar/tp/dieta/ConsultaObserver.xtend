package ar.tp.dieta

interface ConsultaObserver {
	
	def void actualizar(Usuario usuario, queComemos.entrega3.dominio.Receta receta)
	
}