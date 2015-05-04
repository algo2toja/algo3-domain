package ar.tp.dieta

import java.util.List

interface Filtro {
	def List<Receta> aplicarFiltro(List<Receta> recetasSinFiltrar,Grupo unGrupo)

}