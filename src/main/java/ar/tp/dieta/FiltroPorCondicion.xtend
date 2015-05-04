package ar.tp.dieta

import java.util.List

class FiltroPorCondicion implements Filtro {
	override aplicarFiltro(Usuario unUsuario, List<Receta> recetas){
		recetas.forEach[receta | if(receta.esInadecuadaParaUsuario(unUsuario)){
			recetas.remove(receta)}]
		recetas
		
		}
}