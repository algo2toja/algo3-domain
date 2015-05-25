package ar.tp.dieta

import java.util.List
import java.util.ArrayList

class Busqueda {
	List<Filtro> filtros = new ArrayList<Filtro>
	
	def void agregarFiltro(Filtro unFiltro){
		filtros.add(unFiltro)
	}
	
	def void removerFiltro(Filtro unFiltro){
		filtros.remove(unFiltro)
	}
	
	def List<Receta> aplicarBusquedaUsuario(Usuario usuario, List<Receta> recetas) {
		var List<Receta> recetasFiltradas = recetas
		var int counter = 0
		while(counter < filtros.size()){
		//Itero sobre cada filtro en la coleccion y aplico cada filtro una y otra vez sobre la misma coleccion
			recetasFiltradas=filtros.get(counter).aplicarFiltroUsuario(usuario, recetasFiltradas)
			counter++
		}
		recetasFiltradas
	}
	
	def List<Receta> aplicarBusquedaGrupo(Grupo unGrupo, List<Receta> recetas) {
		var List<Receta> recetasFiltradas = recetas
		var int counter = 0
		while(counter < filtros.size()){
		//Itero sobre cada filtro en la coleccion y aplico cada filtro una y otra vez sobre la misma coleccion
			recetasFiltradas=filtros.get(counter).aplicarFiltroGrupo(unGrupo, recetasFiltradas)
			counter++
		}
		recetasFiltradas
	}

}