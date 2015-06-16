package ar.tp.dieta

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import queComemos.entrega3.repositorio.BusquedaRecetas

@Accessors
abstract class ConsultaBase {
	
	List<ConsultaObserver> observadores = new ArrayList<ConsultaObserver>
	
	def actualizarObservers(Usuario usuario, List<String> nombres, BusquedaRecetas busqueda){
		observadores.forEach[observador | observador.actualizar(usuario,nombres,busqueda)]
	}
	
}