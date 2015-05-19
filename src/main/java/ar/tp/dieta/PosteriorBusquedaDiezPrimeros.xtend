package ar.tp.dieta

import java.util.List
import java.util.ArrayList

class PosteriorBusquedaDiezPrimeros extends FiltroDecorator {
	
	new(Filtro decorado){
		super(decorado)
	}
	
	override aplicarFiltro(Usuario unUsuario){
		var List<Receta> recetasFinal = new ArrayList<Receta>
		recetasFiltradas = decorado.aplicarFiltro(unUsuario)
	
		/*var Iterator<Receta> iterRecetas = recetasFiltradas.iterator()
		var int contador = 0
		while(contador < 10){
			recetasFinal.add(iterRecetas.next)
			contador++
		}
		recetasFinal*/
		
		recetasFinal = recetasFiltradas.subList(0,10)  // .sublist(a,b) -> [a;b)
		recetasFinal
		
	}
	
	override aplicarFiltroGrupo(Grupo unGrupo){
		var List<Receta> recetasFinal = new ArrayList<Receta>
		recetasFiltradas = decorado.aplicarFiltroGrupo(unGrupo)
		recetasFinal = recetasFiltradas.subList(0,9)
		recetasFinal
	}
	
}