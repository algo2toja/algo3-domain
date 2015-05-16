package ar.tp.dieta

import java.util.ArrayList
import java.util.List

class FiltroPorIngredienteCaro extends FiltroDecorator {
	//val String[] elementosCaros = #["lechon", "lomo", "salmon", "alcaparras"]
	
	new(Filtro decorado){
		super(decorado)
	}
	
	/*override aplicarFiltro(Usuario unUsuario){
		val List<Receta> recetasFinal = new ArrayList<Receta>
		recetasFiltradas = decorado.aplicarFiltro(unUsuario)
		recetasFiltradas.forEach[receta | unUsuario.devolverRecetasCaras(elementosCaros).contains(receta)]	
		recetasFiltradas = unUsuario.devolverRecetasCaras(elementosCaros)
		this.getRecetas()
		
	}
	
	override aplicarFiltroGrupo(Grupo unGrupo){
		recetasFiltradas = unUsuario.devolverRecetasCaras(elementosCaros)
		this.getRecetas()
	}*/
	
	override aplicarFiltro(Usuario unUsuario){
	val List<Receta> recetasFinal = new ArrayList<Receta>
		recetasFiltradas = decorado.aplicarFiltro(unUsuario)
			recetasFiltradas.forEach[receta | if(!receta.elementosDeReceta.contains("lechon") || !receta.elementosDeReceta.contains("lomo") || !receta.elementosDeReceta.contains("salmon") || receta.elementosDeReceta.contains("alcaparras")){
			recetasFinal.add(receta)}]
		recetasFinal
	}	
	
	override aplicarFiltroGrupo(Grupo unGrupo){
		recetasFiltradas = decorado.aplicarFiltroGrupo(unGrupo)
		recetasFiltradas
	}	
}