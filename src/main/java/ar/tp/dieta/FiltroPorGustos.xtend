package ar.tp.dieta

import java.util.List

class FiltroPorGustos implements Filtro {
	
	override aplicarFiltro(Usuario unUsuario, List<Receta> recetas){
		recetas.forEach[receta | if(unUsuario.noMeGustaEstaReceta(receta)){
			recetas.remove(receta)}]
		recetas
		
		}
}