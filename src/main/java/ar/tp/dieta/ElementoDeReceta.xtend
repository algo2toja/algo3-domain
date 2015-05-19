package ar.tp.dieta

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
abstract class ElementoDeReceta {
	String nombre = new String
	int cantidad
	
	abstract public def boolean soyInadecuadoParaCondicion(Condicion unaCondicion)
	
	def String getNombre(){
		nombre
	}
}	
	
