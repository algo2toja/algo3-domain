package ar.tp.dieta

import java.util.List
import java.util.ArrayList
import java.util.Iterator

class PosteriorBusquedaPares implements Filtro{

	override aplicarFiltroUsuario(Usuario unUsuario, List<Receta> recetasSinFiltrar) {
		//solo toma las recetas en posiciones pares en el array.
		var List<Receta> recetasADevolver = new ArrayList<Receta>
		var Iterator<Receta> iterRecetas = recetasSinFiltrar.iterator()
		var int contador = 1
		while(contador <= 10){
			if((contador%2).equals(0)){ recetasADevolver.add(iterRecetas.next) }
			contador++
		}
		recetasADevolver	}
	
	override aplicarFiltroGrupo(Grupo unGrupo, List<Receta> recetasSinFiltrar) {
		//solo toma las recetas en posiciones pares en el array.
		var List<Receta> recetasADevolver = new ArrayList<Receta>
		var Iterator<Receta> iterRecetas = recetasSinFiltrar.iterator()
		var int contador = 1
		while(contador <= 10){
			if((contador%2).equals(0)){ recetasADevolver.add(iterRecetas.next) }
			contador++
		}
		recetasADevolver	}
	
}