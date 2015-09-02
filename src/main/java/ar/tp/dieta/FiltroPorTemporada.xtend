package ar.tp.dieta

import java.util.ArrayList
import java.util.List

class FiltroPorTemporada implements Filtro{
	
	String temporada
	List<Receta> temporal = new ArrayList<Receta>
	
	new(String parametroTemporada){
		temporada = parametroTemporada
	}
	
	override aplicarFiltroUsuario(Usuario unUsuario, List<Receta> recetasSinFiltrar) {
		recetasSinFiltrar.forEach[receta | if(receta.temporadaALaQueCorresponde.equals(temporada)){
												temporal.add(receta)}]
		return temporal
	}
	
	override aplicarFiltroGrupo(Grupo unGrupo, List<Receta> recetasSinFiltrar) {
	}
	
	
}