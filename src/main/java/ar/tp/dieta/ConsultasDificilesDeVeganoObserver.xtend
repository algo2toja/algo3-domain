package ar.tp.dieta

import queComemos.entrega3.dominio.Dificultad

class ConsultasDificilesDeVeganoObserver implements ConsultaObserver{
	
	int contadorDeVeganos
	
	override actualizar(Usuario usuario, queComemos.entrega3.dominio.Receta receta) { //Implemento la receta de la interfaz dada.
		if(receta.dificultadReceta.equals(Dificultad.DIFICIL) && usuario.tenesEstaCondicion(new CondicionVegano)){
			contadorDeVeganos++
		}
	}
	
	def public mostrarCantidadDeVeganos(){
		contadorDeVeganos
	}
	
}