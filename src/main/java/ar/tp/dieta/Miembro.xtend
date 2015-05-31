package ar.tp.dieta

import java.util.Iterator
import java.util.List

abstract class Miembro {
	
	def void agregarBusqueda(Busqueda unaBusqueda){
		misBusquedas.add(unaBusqueda)
	}
	
	def void removerBusqueda(Busqueda unaBusqueda){
		misBusquedas.remove(unaBusqueda)
	}
	
	public def getRecetas(String nombre, String dificultad, List<String> palabrasClave){
		consulta.buscarReceta(this,nombre,dificultad,palabrasClave)
 	}
 	
 	def List<Receta> busquedaFiltrada(){
		var List<Receta> recetasFiltradas = recetasQuePuedoVer()
	
		if(!misBusquedas.empty){
			var Iterator<Busqueda> iterBusqueda = misBusquedas.iterator()
	 		while(iterBusqueda.hasNext){
	   			recetasFiltradas = (iterBusqueda.next).aplicarBusquedaUsuario(this,recetasFiltradas)
			}
		}
		recetasFiltradas
	}
 	
 }
 