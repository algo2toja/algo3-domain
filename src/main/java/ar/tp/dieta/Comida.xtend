package ar.tp.dieta

class Comida {

	//asumimos que una comida (ingrediente) es no recomendable solamente para 1 condicion preexistente
	String Nombre   // hay q usarlas en los metodos de abajo
	double cantidad

	def Condicion noSeRecomiendaParaCondicion() {
		
		if (salOCaldo()) {			
			new CondicionHipertension
			
		} else if (azucarSuperaCantidadMax(){   // aca tira error el corchete pq no estara bien el anidamiento de los if
			new CondicionDiabetes
			
		} else if (deCarnivoros()){
			new CondicionVegano
			
		}
	}
	
	def boolean deCarnivoros() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	def boolean azucarSuperaCantidadMax() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	def boolean salOCaldo() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}
