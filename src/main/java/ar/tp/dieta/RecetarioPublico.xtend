package ar.tp.dieta

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors

class RecetarioPublico implements Cloneable{
	List<Receta> recetas = new ArrayList<Receta>()

	def void agregarReceta(Receta unaReceta) {
		//agrega recetas al recetario
		recetas.add(unaReceta)
	}

	def void mirarRecetario() {
		//imprime los nombres de las recetas
		recetas.forEach[receta|println(receta.getNombreDeLaReceta)]
	}

	def elegirReceta(String nombre) {
		// devuelve la primer receta que conincide con el nombre pasado
		recetas.findFirst[receta|receta.getNombreDeLaReceta == nombre]
	}
	

}