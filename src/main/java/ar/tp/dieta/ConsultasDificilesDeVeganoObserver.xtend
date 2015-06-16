package ar.tp.dieta

import java.util.List
import queComemos.entrega3.repositorio.BusquedaRecetas

class ConsultasDificilesDeVeganoObserver implements ConsultaObserver{
	
	int contadorDeVeganos
	
	override actualizar(Usuario usuario, List<String> nombres, BusquedaRecetas busqueda) { //Implemento la receta de la interfaz dada.
		if(busqueda.dificultad.equals("DIFICIL") && usuario.tenesEstaCondicion(new CondicionVegano)){
			contadorDeVeganos++
		}
	}
	
	def public mostrarCantidadDeVeganos(){
		contadorDeVeganos
	}
	
}