package ar.tp.dieta

import java.util.ArrayList
import java.util.List

class FiltroPorIngredienteCaro implements Filtro {
	val String[] elementosCaros = #["lechon", "lomo", "salmon", "alcaparras"]
	
	
	
	override aplicarFiltroUsuario(Usuario unUsuario,List<Receta> recetas ){
		val List<Receta> recetasFinal = new ArrayList<Receta>
		recetas.forEach[receta | if(!receta.contieneAlguno(elementosCaros)){ recetasFinal.add(receta)}]
		recetasFinal
	}
	
/* 	
	override aplicarFiltroUsuario(Usuario unUsuario, List<Receta> recetas){
		val List<Receta> recetasFiltradas = new ArrayList<Receta>
		recetas.forEach[receta | if(!receta.elementosDeReceta.contains("lechon") || !receta.elementosDeReceta.contains("lomo") || !receta.elementosDeReceta.contains("salmon") || !receta.elementosDeReceta.contains("alcaparras")){
			recetasFiltradas.add(receta)}]
		recetasFiltradas
		
	}
*/	
	override aplicarFiltroGrupo(Grupo unGrupo, List<Receta> recetasSinFiltrar) {
	}
	
}