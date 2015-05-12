package ar.tp.dieta

import java.util.ArrayList
import java.util.List

class FiltroPorCondicion extends FiltroDecorator {
	/*override aplicarFiltroUsuario(Usuario unUsuario, List<Receta> recetas){
		recetas.forEach[receta | if(receta.esInadecuadaParaUsuario(unUsuario)){
			recetas.remove(receta)}]
		recetas
		
		}
		
	override aplicarFiltroGrupo(Grupo unGrupo){
		val List<Receta> recetasFiltradas = new ArrayList<Receta>
		unGrupo.devolverRecetas.forEach[receta | if(!receta.esInadecuadaParaGrupo(unGrupo)){
			recetasFiltradas.add(receta)}]
		recetasFiltradas
		
	}*/
	
	new(Filtro decorado) {
		super(decorado)
	}
	
	override aplicarFiltro(Usuario unUsuario){
		val List<Receta> recetasFinal = new ArrayList<Receta>
		recetasFiltradas = decorado.aplicarFiltro(unUsuario)
		recetasFiltradas.forEach[receta | if(!receta.esInadecuadaParaUsuario(unUsuario)){recetasFinal.add(receta)}]
		recetasFinal
	}	
		
}