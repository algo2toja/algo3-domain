package ar.tp.dieta

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors

class RecetarioPublico {
	List<Receta> recetas = new ArrayList<Receta>()

	def void agregarReceta(Receta unaReceta) {
		recetas.add(unaReceta)
	}

	def void mirarRecetario() {
		recetas.forEach[receta|println(receta.getNombreDeLaReceta)]
	}

	def elegirReceta(String nombre) {
		// copiar esa receta a colleccion recetas de usuario
		recetas.findFirst[receta|receta.getNombreDeLaReceta == nombre]
	}
	

}