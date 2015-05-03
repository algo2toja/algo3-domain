package ar.tp.dieta

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
abstract class ElementoDeReceta {
	String nombre
	int cantidad
	
	abstract public def boolean soyInadecuadoParaCondicion(Condicion unaCondicion)
	
}	
	
