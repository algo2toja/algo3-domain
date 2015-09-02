package ar.tp.dieta

import java.util.ArrayList
import java.util.List

class FiltroPorIngrediente implements Filtro{
	
	String ingrediente
	List<Receta> temporal = new ArrayList<Receta>
	
	new(String parametroIngrediente){
		ingrediente = parametroIngrediente
	}
	
	override aplicarFiltroUsuario(Usuario unUsuario, List<Receta> recetasSinFiltrar) {
		recetasSinFiltrar.forEach[receta | receta.elementosDeReceta.forEach[ elemento | if(elemento.nombre.equals(ingrediente)){
																								temporal.add(receta)}]]
		return temporal
	}
	
	override aplicarFiltroGrupo(Grupo unGrupo, List<Receta> recetasSinFiltrar) {
	}
	
	
}