package ar.tp.dieta

import java.util.ArrayList
import java.util.List

abstract class FiltroDecorator implements Filtro {
	
	public Filtro decorado
	public List<Receta> recetasFiltradas = new ArrayList<Receta>
	
	new(Filtro filtro){
		decorado=filtro
	}
	
	def setFiltro(Filtro filtro) {
		this.decorado = filtro
	}
	
	override getRecetasFromUsuario(Usuario unUsuario){
		decorado.getRecetasFromUsuario(unUsuario)
	}

	override getRecetasFromGrupo(Grupo unGrupo){
		
		
	}
	//override aplicarFiltro(Usuario unUsuario){}
	//override aplicarFiltroGrupo(Grupo unGrupo){}
	override getFiltro(){
		decorado
	}
	
}