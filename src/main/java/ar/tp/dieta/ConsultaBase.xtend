package ar.tp.dieta

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
abstract class ConsultaBase {
	
	List<ConsultaObserver> observadores = new ArrayList<ConsultaObserver>
	
	def actualizarObservers(Usuario usuario, Receta receta){
		observadores.forEach[observador | observador.actualizar(usuario,receta)]
	}
	
}