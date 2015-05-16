package ar.tp.dieta

import java.util.ArrayList
import java.util.List

class FiltroPorCondicion extends FiltroDecorator {
	
	new(Filtro decorado) {
		super(decorado)
	}
	
	override aplicarFiltro(Usuario unUsuario){
		val List<Receta> recetasFinal = new ArrayList<Receta>
		recetasFiltradas = decorado.aplicarFiltro(unUsuario)
		recetasFiltradas.forEach[receta | if(!receta.esInadecuadaParaUsuario(unUsuario)){recetasFinal.add(receta)}]
		recetasFinal
	}
	
	override aplicarFiltroGrupo(Grupo unGrupo){
		val List<Receta> recetasFinal = new ArrayList<Receta>
		recetasFiltradas = decorado.aplicarFiltroGrupo(unGrupo)
		recetasFiltradas.forEach[receta | if(!receta.esInadecuadaParaGrupo(unGrupo)){
				recetasFinal.add(receta)}]
		recetasFinal
	}
		
}