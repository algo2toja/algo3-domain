package ar.tp.dieta

import java.util.ArrayList
import java.util.List

abstract class FiltroDecorator implements Filtro {
	
	Filtro decorado
	public List<Receta> recetasFiltradas = new ArrayList<Receta>
	
	def setFiltro(Filtro filtro) {
		this.decorado = filtro
	}
	
	override getRecetasFromUsuario(Usuario unUsuario){
		decorado.getRecetasFrom(unUsuario)
	}

	override getRecetasFromGrupo(Grupo unGrupo){
		
	}
	override aplicarFiltro(Usuario unUsuario){}
	override getFiltro(){
		decorado
	}
	
}