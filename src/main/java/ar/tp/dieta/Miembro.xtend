package ar.tp.dieta

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
abstract class Miembro {
	
	protected String nombre
	protected List<String> preferencias = new ArrayList<String>
	protected List<Busqueda> misBusquedas = new ArrayList<Busqueda>
	protected RecetarioPublico recetario
	
	def void agregarBusqueda(Busqueda unaBusqueda){
		misBusquedas.add(unaBusqueda)
	}
	
	def void removerBusqueda(Busqueda unaBusqueda){
		misBusquedas.remove(unaBusqueda)
	}

}