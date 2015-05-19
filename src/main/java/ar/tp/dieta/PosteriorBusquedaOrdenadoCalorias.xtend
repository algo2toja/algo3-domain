package ar.tp.dieta

import java.util.List

class PosteriorBusquedaOrdenadoCalorias extends FiltroDecorator {
	
	new(Filtro decorado){
		super(decorado)
	}
	
	override List<Receta> aplicarFiltro(Usuario unUsuario){
		recetasFiltradas = decorado.aplicarFiltro(unUsuario)
			
		recetasFiltradas.sortBy[calorias]
		recetasFiltradas
	}
	
	override aplicarFiltroGrupo(Grupo unGrupo){
		
		recetasFiltradas = decorado.aplicarFiltroGrupo(unGrupo)
		recetasFiltradas.sortBy[calorias]
		recetasFiltradas
	}
}