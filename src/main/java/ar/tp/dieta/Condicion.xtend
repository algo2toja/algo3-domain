package ar.tp.dieta

abstract class Condicion {

	def boolean esDiabetes(){
		false
	}
	
	def boolean esHipertension(){
		false
	}

	def boolean esVegano(){
		false
	}
	
	def boolean esCeliaco(){
		false
	}
	
	def boolean seSubsana(Usuario unUsuario){
		true
	}
	
}