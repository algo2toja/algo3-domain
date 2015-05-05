package ar.tp.dieta

import ar.tp.dieta.PosteriorBusqueda
import java.util.List
import java.util.Iterator
import java.util.ArrayList

class PosteriorBusquedaDiezPrimeros extends PosteriorBusqueda {
	
	override List<Receta> procesarBusqueda(List<Receta> recetasObtenidas){
		//solo toma los 10 primeros resultados *** modificado a lo 2 primeros para test***
		var List<Receta> recetasADevolver = new ArrayList<Receta>
		var Iterator<Receta> iterRecetas = recetasObtenidas.iterator()
		var int contador = 0
		while(contador < 2){
			recetasADevolver.add(iterRecetas.next)
			contador++
		}
		recetasADevolver
	}
}