package ar.tp.dieta

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
abstract class ElementoDeReceta {
	String nombre = new String
	int cantidad
	
	abstract public def boolean soyInadecuadoParaCondicion(Condicion unaCondicion)
	
	def String getNombre(){
		nombre
	}
}	
	
