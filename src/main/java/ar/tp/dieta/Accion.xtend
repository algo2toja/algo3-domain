package ar.tp.dieta

import java.util.List
import queComemos.entrega3.repositorio.BusquedaRecetas

interface Accion {
	
	def void execute(Usuario usuario, BusquedaRecetas busqueda, List<String> nombresRecetas)
}