package ar.tp.dieta

import java.util.List

class FiltroExcesoDeCalorias implements Filtro {
	override aplicarFiltro(Usuario unUsuario, List<Receta> recetas){
		if(unUsuario.indiceDeMasaCorporal >= 30){
			recetas.forEach[receta | if(receta.calorias >= 500){ recetas.remove(receta)}]
		}recetas
		
	}
}