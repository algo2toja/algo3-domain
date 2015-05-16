package ar.tp.dieta

import java.util.ArrayList
import java.util.List

class PosteriorBusquedaPares extends FiltroDecorator {
	
	new(Filtro decorado){
		super(decorado)
	}
	
	override List<Receta> aplicarFiltro(Usuario unUsuario){
		//solo toma las recetas en posiciones pares en el array.
		var List<Receta> recetasFinal = new ArrayList<Receta>
		recetasFiltradas = decorado.aplicarFiltro(unUsuario)
		var int contador = 0
		while(contador <= recetasFiltradas.size){
			recetasFinal.add(recetasFiltradas.get(contador))
			contador += 2
		}
		recetasFinal
	}	
	
	override List<Receta> aplicarFiltroGrupo(Grupo unGrupo){
		var List<Receta> recetasFinal = new ArrayList<Receta>
		recetasFiltradas = decorado.aplicarFiltroGrupo(unGrupo)
		var int contador = 0
		while(contador <= recetasFiltradas.size){
			recetasFinal.add(recetasFiltradas.get(contador))
			contador += 2
		}
		recetasFinal
	}
}