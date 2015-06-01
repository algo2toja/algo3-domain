package ar.tp.dieta

class ConsultasDificilesDeVeganoObserver implements ConsultaObserver{
	
	int contadorDeVeganos
	
	override actualizar(Usuario usuario,Receta receta){
		if(receta.getDificultadDePreparacion.equals("Dificil") && usuario.tenesEstaCondicion(new CondicionVegano)){
			contadorDeVeganos++
		}
	}
	
	def public mostrarCantidadDeVeganos(){
		contadorDeVeganos
	}

	
}