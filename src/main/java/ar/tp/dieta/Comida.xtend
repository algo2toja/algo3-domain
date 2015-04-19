package ar.tp.dieta

class Comida {

	//asumimos que una comida (ingrediente) es no recomendable solamente para 1 condicion preexistente
	String nombre   // hay q usarlas en los metodos de abajo
	double cantidad

	def Condicion noSeRecomiendaParaCondicion() {
		
		if (salOCaldo()) {			
			new CondicionHipertension
			
		} else if (azucarSuperaCantidadMax()){
			new CondicionDiabetes
			
		} else if (deCarnivoros()){
			new CondicionVegano
			
		}
	}
	
	def boolean deCarnivoros() {
		(soyCarne == true)
	}
	
	def boolean azucarSuperaCantidadMax() {
		(nombre == "azucar" && cantidad >=100)
	}
	
	def boolean salOCaldo() {
		(nombre == "sal" || nombre == "caldo")
	}
	
	def soyCarne(){
		false
	}
	
	/*def soyFruta(){
		false
	}
	
	def soyPescado(){
		false
	}
	
	def soyMarisco(){
		false
	}
	
	def soyCondimento(){
		false
	}
	
	def soyVerdura(){
		false
	}*/
}
