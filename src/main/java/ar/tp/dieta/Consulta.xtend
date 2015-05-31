package ar.tp.dieta

import java.util.List

class Consulta {
	
	public def buscarReceta(Usuario usuario, String nombre, String dificultad, List<String> palabrasClave){
		
		usuario.recetasQuePuedoVer().filter[receta | receta.getNombre().equals(nombre)]
		.filter[receta | receta.getDificultadDePreparacion().equals(dificultad)]
		.filter[receta | receta.contieneAlguno(palabrasClave)]
		
		var jsonObject recetaBuscada = new JsonObject().add( "Nombre", /*Funcion que devuelve el string nombre*/).add("Lista de ingredientes", /*Funcion que devuelve la lista de ingr*/).add("Tiempo de preparacion", /*Funcion que devuelve tiempo de preparacion*/).add("Total de calorias",  /*Funcion que devuelve tiempo de preparacion*/).add("Dificultad de preparacion",  /*Funcion que devuelve dificultad de la receta*/).add("No es apta para",/*calcular condiciones preexistentes*/).add("Autor",  /*Funcion que devuelve el autor*/).add("Año de creacion", /*Funcion que devuelve el año*/)
		recetaBuscada.writeTo( writer )
 	}
}