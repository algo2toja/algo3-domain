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
		if(this.busquedaReceta(nombre)==null){
			throw new BusinessException("La receta buscada no existe.")
		}
		this.busquedaReceta(nombre)
		// devuelve la primer receta que conincide con el nombre pasado
		
	}
	
	def busquedaReceta(String nombreReceta){
		recetas.findFirst[receta|receta.getNombreDeLaReceta.equals(nombreReceta)]
	}
	
/*copiarReceta inicializa una nueva variable recetaTemporal, a 
 * la que se le va a asignar la coincidencia de buscar la receta
 * requerida en el listado de recetas (metodo busquedaReceta)
 * luego se copiaran todos los atributos 1x1 de una receta a otra y
 *  se retornara la nueva Receta con todos los atributos copiados*/
	
	def Receta copiarReceta(Receta unaReceta, String nombreReceta){
		var Receta recetaTemporal = this.busquedaReceta(nombreReceta)
		
		unaReceta.setNombreDeLaReceta(recetaTemporal.getNombreDeLaReceta())
		unaReceta.setCalorias(recetaTemporal.getCalorias())
		unaReceta.setProcesoDePreparacion(recetaTemporal.getProcesoDePreparacion())
		unaReceta.setDificultadDePreparacion(recetaTemporal.getDificultadDePreparacion())
		unaReceta.setTemporadaALaQueCorresponde(recetaTemporal.getTemporadaALaQueCorresponde())
		//unaReceta.subRecetas = recetaTemporal.subRecetas.clone()
		
		//Workaround para ArrayList, en vez de usar clone se inicializa un nuevo ArrayList con el mismo contenido que recetaTemporal
		unaReceta.elementosDeReceta = new ArrayList<ElementoDeReceta>(recetaTemporal.elementosDeReceta)
		
		//Devuelvo el objeto
		unaReceta
	}
	
}