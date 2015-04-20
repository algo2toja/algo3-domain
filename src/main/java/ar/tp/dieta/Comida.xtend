package ar.tp.dieta

class Comida {

	//asumimos que una comida (ingrediente) es no recomendable solamente para 1 condicion preexistente
	String nombre   //Puede ser tanto un ingrediente como un condimento ya que todavia no hay una diferencia marcada. 
	double cantidad

	def Condicion noSeRecomiendaParaCondiciones() {
		this.noRecomendableParaHipertensos
		this.noRecomendableParaDiabeticos
		this.noRecomendableParaVeganos
	}
	
	def noRecomendableParaVeganos() {
		if(nombre == "carne" || nombre == "chori" || nombre == "chivito" || nombre == "pollo"){
			new CondicionVegano
		}
	}
	
	def noRecomendableParaDiabeticos() {
		if(nombre == "azucar" && cantidad >=100){
			new CondicionDiabetes
		}
	}
	
	def noRecomendableParaHipertensos() {
		if(nombre == "sal" || nombre == "caldo"){
			new CondicionHipertension
		}
	}

}