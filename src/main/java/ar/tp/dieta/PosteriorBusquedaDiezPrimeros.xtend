package ar.tp.dieta

import java.util.List
import java.util.Iterator
import java.util.ArrayList

class PosteriorBusquedaDiezPrimeros implements Filtro{
	
	override aplicarFiltroUsuario(Usuario unUsuario, List<Receta> recetasSinFiltrar) {
		//solo toma los 10 primeros resultados *** modificado a los 5 primeros para test***
		var List<Receta> recetasADevolver = new ArrayList<Receta>
		var Iterator<Receta> iterRecetas = recetasSinFiltrar.iterator()
		var int contador = 0
		while(contador < 5){
			recetasADevolver.add(iterRecetas.next)
			contador++
		}
		recetasADevolver
	}
	
	override aplicarFiltroGrupo(Grupo unGrupo, List<Receta> recetasSinFiltrar) {
		//solo toma los 10 primeros resultados *** modificado a los 5 primeros para test***
		var List<Receta> recetasADevolver = new ArrayList<Receta>
		var Iterator<Receta> iterRecetas = recetasSinFiltrar.iterator()
		var int contador = 0
		while(contador < 5){
			recetasADevolver.add(iterRecetas.next)
			contador++
		}
		recetasADevolver
	}
	
}