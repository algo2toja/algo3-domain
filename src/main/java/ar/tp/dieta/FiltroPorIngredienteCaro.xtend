package ar.tp.dieta

import java.util.List

class FiltroPorIngredienteCaro implements Filtro {
	//val String[] elementosCaros = #["lechon", "lomo", "salmon", "alcaparras"]
	override aplicarFiltro(Usuario unUsuario, List<Receta> recetas){
		recetas.forEach[receta | if(receta.elementosDeReceta.contains("lechon") || receta.elementosDeReceta.contains("lomo") || receta.elementosDeReceta.contains("salmon") || receta.elementosDeReceta.contains("alcaparras")){
			recetas.remove(receta)}]
		recetas
		
		}
}