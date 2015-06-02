package ar.tp.dieta

import java.util.List

class Consulta extends ConsultaBase{
	
	JsonSimplePrinter json
	
	public def buscarReceta(Usuario usuario, String nombre){
		var Iterable<Receta> listaTemporal = usuario.recetasQuePuedoVer
		.filter[it.getNombre().equals(nombre)]
		
		if(listaTemporal.size.equals(0)){
			println("No hay recetas que cumplan con la busqueda")
		}else{
			//resultado = listaTemporal.get(0)
			listaTemporal.forEach[receta | actualizarObservers(usuario,receta)]
			json.printListaDeRecetas(listaTemporal)
		}	
 	}
 	
 	public def buscarReceta(Usuario usuario, String dificultad, List<String> palabrasClave){
		var Iterable<Receta> listaTemporal = usuario.recetasQuePuedoVer
		.filter[it.getDificultadDePreparacion().equals(dificultad)]
		.filter[it.contieneAlguno(palabrasClave)]
		
		if(listaTemporal.size.equals(0)){
			println("No hay recetas que cumplan con la busqueda")
		}else{
			//resultado = listaTemporal.get(0)
			listaTemporal.forEach[receta | actualizarObservers(usuario,receta)]
			json.printListaDeRecetas(listaTemporal)
		}
 	}
}