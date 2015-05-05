package ar.tp.dieta

import java.util.List

class FiltroExcesoDeCalorias implements Filtro {
	
	override aplicarFiltro(Usuario unUsuario, List<Receta> recetas){
		if(unUsuario.tieneSobrepeso){
			recetas.forEach[receta | if(receta.exesoDeCalorias){ recetas.remove(receta)}]
		}recetas
	}
}