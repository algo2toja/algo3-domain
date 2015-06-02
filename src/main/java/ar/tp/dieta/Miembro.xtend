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
	
	////////////////////////////////METODOS PARA IMPRIMIR EN JSON////////////////////////////////////
	
	/*public def getRecetas(String nombre, String dificultad, List<String> palabrasClave){
		consulta.buscarReceta(this,nombre,dificultad,palabrasClave)
 	}*/
 	
 	public def getRecetas(String nombre){
		consulta.buscarReceta(this,nombre)
 	}
 	
 	public def getRecetas(String dificultad, List<String> palabrasClave){
		consulta.buscarReceta(this,dificultad,palabrasClave)
 	}
 
 	
 	////////////////////////////////////////////////////////////////////////////////////////////////
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
 