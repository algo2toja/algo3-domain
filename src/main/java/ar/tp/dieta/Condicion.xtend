package ar.tp.dieta

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
abstract class Condicion {

	public def boolean esDiabetes() {
		false
	}

	public def boolean esHipertension() {
		false
	}

	public def boolean esVegano() {
		false
	}

	public def boolean esCeliaco() {
		false
	}

	public def boolean seSubsana(Usuario unUsuario) {
		true
	}
	
	public def boolean validarCondicion(Usuario unUsuario){
		true
	}

	public def boolean ingredienteEsInadecuado(ElementoDeReceta unElemento){
		false
	}

}