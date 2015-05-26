package ar.tp.dieta

import java.util.List

interface Filtro {
	
	def List<Receta> aplicarFiltroUsuario(Usuario unUsuario, List<Receta> recetasSinFiltrar)
	def List<Receta> aplicarFiltroGrupo(Grupo unGrupo, List<Receta> recetasSinFiltrar)			
}