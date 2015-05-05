package ar.tp.dieta

import ar.tp.dieta.PosteriorBusqueda
import java.util.List
import java.util.ArrayList
import java.util.Iterator

class PosteriorBusquedaPares extends PosteriorBusqueda {
	
	override List<Receta> procesarBusqueda(List<Receta> recetasObtenidas){
		//solo toma las recetas en posiciones pares en el array.
		var List<Receta> recetasADevolver = new ArrayList<Receta>
		var Iterator<Receta> iterRecetas = recetasObtenidas.iterator()
		var int contador = 1
		while(contador <= 10){
			if((contador%2).equals(0)){ recetasADevolver.add(iterRecetas.next) }
			contador++
		}
		recetasADevolver
	}	
}