package ar.tp.dieta

import queComemos.entrega3.dominio.Dificultad

class ConsultasDificilesDeVeganoObserver implements ConsultaObserver{
	
	int contadorDeVeganos
	
	override actualizar(Usuario usuario, String nombre, String dif) { //Implemento la receta de la interfaz dada.
		if(dif.equals("DIFICIL") && usuario.tenesEstaCondicion(new CondicionVegano)){
			contadorDeVeganos++
		}
	}
	
	def public mostrarCantidadDeVeganos(){
		contadorDeVeganos
	}
	
}