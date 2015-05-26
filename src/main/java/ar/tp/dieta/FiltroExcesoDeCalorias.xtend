package ar.tp.dieta

import java.util.List
import java.util.ArrayList

class FiltroExcesoDeCalorias implements Filtro {

	override List<Receta> aplicarFiltroUsuario(Usuario unUsuario, List<Receta> recetas) {
		if (unUsuario.tieneSobrepeso) {
			var List<Receta> recetasADevolver = new ArrayList<Receta>
			for (Receta elemento : recetas.filter[receta|!receta.exesoDeCalorias]) {
				recetasADevolver.add(elemento)
			}
			recetasADevolver
		}else { recetas }
	}
	override aplicarFiltroGrupo(Grupo unGrupo, List<Receta> recetasSinFiltrar) {
	}
	
}