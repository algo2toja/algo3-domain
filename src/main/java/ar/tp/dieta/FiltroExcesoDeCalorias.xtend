package ar.tp.dieta

import java.util.List
import java.util.ArrayList

class FiltroExcesoDeCalorias extends FiltroDecorator {

	/*override List<Receta> aplicarFiltro(Usuario unUsuario, List<Receta> recetas) {
		if (unUsuario.tieneSobrepeso) {
			var List<Receta> recetasADevolver = new ArrayList<Receta>
			for (Receta elemento : recetas.filter[receta|!receta.exesoDeCalorias]) {
				recetasADevolver.add(elemento)
			}
			recetasADevolver
		}else { recetas }
	}*/
	new (Filtro decorado){
		super(decorado)
	}
	
	/*override setFiltro(Filtro filtro){
		super(filtro)
	}*/
	
	override aplicarFiltro(Usuario unUsuario){
		val List<Receta> recetasFinal = new ArrayList<Receta>
		recetasFiltradas = decorado.aplicarFiltro(unUsuario)
		recetasFiltradas.forEach[receta | if(!(unUsuario.tieneSobrepeso && receta.exesoDeCalorias)){recetasFinal.add(receta)}]
		recetasFinal
	}	
}