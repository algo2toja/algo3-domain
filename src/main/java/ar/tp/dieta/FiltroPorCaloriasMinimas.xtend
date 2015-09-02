package ar.tp.dieta

import java.util.ArrayList
import java.util.List

class FiltroPorCaloriasMinimas implements Filtro{
	
	int calorias
	List<Receta> temporal = new ArrayList<Receta>
	
	new(int parametroCalorias){
		calorias = parametroCalorias
	}
	
	override aplicarFiltroUsuario(Usuario unUsuario, List<Receta> recetasSinFiltrar) {
		recetasSinFiltrar.forEach[receta | if(receta.calorias >= calorias){
												temporal.add(receta)}]
		return temporal
	}
	
	override aplicarFiltroGrupo(Grupo unGrupo, List<Receta> recetasSinFiltrar) {
	}
	
	
}