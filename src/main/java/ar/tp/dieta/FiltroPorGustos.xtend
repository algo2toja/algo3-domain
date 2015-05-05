package ar.tp.dieta

import java.util.List
import java.util.ArrayList

class FiltroPorGustos implements Filtro {
	
	override aplicarFiltro(Usuario unUsuario, List<Receta> recetas){
		var List<Receta> recetasADevolver = new ArrayList<Receta>
		for (Receta elemento :recetas.filter[receta | !unUsuario.noMeGustaEstaReceta(receta)]) {
				recetasADevolver.add(elemento)
			}
			recetasADevolver
		}
}
