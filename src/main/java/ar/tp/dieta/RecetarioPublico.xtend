package ar.tp.dieta

import java.util.List

class RecetarioPublico {
	List<Receta> recetas

	def void agregarReceta(Receta unaReceta){
		recetas.add(unaReceta)
	}
	
	def void mirarRecetario(){
		recetas.forEach[receta | println(receta.getNombreDeLaReceta)]
	}
	
	def elegirReceta(String nombre){
		//copiar esa receta a colleccion recetas de usuario
		recetas.findFirst[receta | receta.getNombreDeLaReceta == nombre]
	}
	
}