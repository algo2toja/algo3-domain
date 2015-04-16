package ar.tp.dieta

abstract class Condicion {

	def esDiabetes(){
		false
	}
	
	def esHipertension(){
		false
	}

	def esVegano(){
		false
	}
	
	def esCeliaco(){
		false
	}
	
	def seSubsana(Usuario unUsuario){
		true
	}
	
}