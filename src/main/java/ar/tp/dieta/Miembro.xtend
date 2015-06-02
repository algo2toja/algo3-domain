package ar.tp.dieta

import java.util.ArrayList
import java.util.List

abstract class Miembro {
	
	List<Busqueda> misBusquedas = new ArrayList<Busqueda>
	
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
 	
 	////////////////////////////////////////////////////////////////////////////////////////////////
 	
 }
 