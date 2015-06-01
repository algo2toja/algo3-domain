package ar.tp.dieta

import java.util.ArrayList
import java.util.List
import javax.json.JsonObject

class Consulta extends ConsultaBase{
	
	public def buscarReceta(Usuario usuario, String nombre, String dificultad, List<String> palabrasClave){
		var Receta resultado
		var Iterable<Receta> listaTemporal = usuario.recetasQuePuedoVer
		.filter[receta | receta.getNombre().equals(nombre)]
		.filter[receta | receta.getDificultadDePreparacion().equals(dificultad)]
		.filter[receta | receta.contieneAlguno(palabrasClave)]
		
		if(listaTemporal.size.equals(0)){
			println("No hay recetas que cumplan con la busqueda")
		}else{
			resultado = listaTemporal.get(0)
			actualizarObservers(usuario,resultado)
		}
		
		var jsonObject recetaBuscada = new JsonObject().add( "Nombre", resultado.getNombreDeLaReceta()/*Funcion que devuelve el string nombre*/).add("Lista de ingredientes", resultado.getElementosDeReceta.filter[elemento | elemento.getClass().equals((new Ingrediente).getClass())]/*Funcion que devuelve la lista de ingr*/).add("Tiempo de preparacion", resultado.getTiempoPreparacion()/*Funcion que devuelve tiempo de preparacion*/).add("Total de calorias", resultado.getCalorias/*Funcion que devuelve tiempo de preparacion*/).add("Dificultad de preparacion",  resultado.getDificultadDePreparacion/*Funcion que devuelve dificultad de la receta*/).add("No es apta para", /*calcular condiciones preexistentes*/).add("Autor",  resultado.getAutor/*Funcion que devuelve el autor*/).add("Año de creacion", resultado.getAñoDeCreacion/*Funcion que devuelve el año*/)
		recetaBuscada.writeTo( writer )
 	}
}