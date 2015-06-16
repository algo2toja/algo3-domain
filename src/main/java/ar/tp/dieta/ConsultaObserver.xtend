package ar.tp.dieta

import java.util.List
import queComemos.entrega3.repositorio.BusquedaRecetas

interface ConsultaObserver {
	
	def void actualizar(Usuario usuario, List<String> nombres, BusquedaRecetas busqueda)
	
}