package ar.tp.dieta

import java.util.ArrayList
import java.util.List

class FiltroPorDificultad implements Filtro{
	
	String dificultad
	List<Receta> temporal = new ArrayList<Receta>
	
	new(String parametroDificultad){
		dificultad = parametroDificultad
	}
	
	override aplicarFiltroUsuario(Usuario unUsuario, List<Receta> recetasSinFiltrar) {
		recetasSinFiltrar.forEach[receta | if(receta.dificultadDePreparacion.equals(dificultad)){
												temporal.add(receta)}]
		return temporal
	}
	
	override aplicarFiltroGrupo(Grupo unGrupo, List<Receta> recetasSinFiltrar) {
	}
	
	
}