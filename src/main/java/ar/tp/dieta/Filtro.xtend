package ar.tp.dieta

import java.util.List

interface Filtro {
	
	def List<Receta> aplicarFiltro(Usuario unUsuario, List<Receta> recetasSinFiltrar)		
}