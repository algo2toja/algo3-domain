package ar.tp.dieta

import java.util.List

class Consulta extends ConsultaBase{
	
	public def buscarReceta(Usuario usuario, String nombre, String dificultad, List<String> palabrasClave){
		var Receta resultado
		var Iterable<Receta> listaTemporal = usuario.recetasQuePuedoVer
		.filter[it.getNombre().equals(nombre)]
		.filter[it.getDificultadDePreparacion().equals(dificultad)]
		.filter[it.contieneAlguno(palabrasClave)]
		
		if(listaTemporal.size.equals(0)){
			println("No hay recetas que cumplan con la busqueda")
		}else{
			resultado = listaTemporal.get(0)
			actualizarObservers(usuario,resultado)
		}
 	}
}