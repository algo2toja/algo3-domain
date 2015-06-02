package ar.tp.dieta

import java.util.ArrayList
import java.util.List

class Consulta extends ConsultaBase{
	
	JsonSimplePrinter json = new JsonSimplePrinter
	
	public def buscarReceta(Usuario usuario, String nombre){
		var List<Receta> listaTemporal = usuario.recetasQuePuedoVer
		val List<Receta> listaTemporal2 = new ArrayList<Receta>
		//listaTemporal = listaTemporal.filter[receta | receta.devolverNombre.equals(nombre)]
		listaTemporal.forEach[receta | if(receta.tuNombreEsEste(nombre)){
										listaTemporal2.add(receta)
		}]
		
		
		if(listaTemporal2.size.equals(0)){
			println("No hay recetas que cumplan con la busqueda")
		}else{
			//resultado = listaTemporal.get(0)
			listaTemporal2.forEach[receta | actualizarObservers(usuario,receta)]
			json.printListaDeRecetas(listaTemporal2)
		}	
 	}
 	
 	public def buscarReceta(Usuario usuario, String dificultad, List<String> palabrasClave){
		var Iterable<Receta> listaTemporal = usuario.recetasQuePuedoVer
		listaTemporal = listaTemporal.filter[it.getDificultadDePreparacion().equals(dificultad)]
		listaTemporal = listaTemporal.filter[it.contieneAlguno(palabrasClave)]
		
		if(listaTemporal.size.equals(0)){
			println("No hay recetas que cumplan con la busqueda")
		}else{
			//resultado = listaTemporal.get(0)
			listaTemporal.forEach[receta | actualizarObservers(usuario,receta)]
			json.printListaDeRecetas(listaTemporal)
		}
 	}
}