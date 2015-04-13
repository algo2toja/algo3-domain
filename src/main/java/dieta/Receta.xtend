package dieta

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Receta {
	String nombre
	List<Comida> ingredientes
	List<Comida> condimentos
	String proceso
	List<String> condicionesPreexistentes
	int calorias
	String dificultad
	String epoca
	Usuario creador
	List<Receta>subRecetas
	
	new(String nobmre, String proceso, int calorias, Object dificultad, String epoca) {
	
	}
	
	def agregarCondimentos() {
		
	}
	
	def agregarIngredientes() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	



	def condicionesPreexistentes(){
		//val boolean i = false
		
		if (condimentos.exists([condimento | condimento.getNombre() == "caldo" || condimento.getNombre() == "sal"])){
				condicionesPreexistentes.add("hipertenso")
		}
		if (condimentos.exists([condimento |condimento.getNombre() == "azucar" && condimento.getCantidad() >= 100 ])){
				condicionesPreexistentes.add("diabetico")
		}
	
		if (ingredientes.exists([ingrediente | ingrediente.getNombre() == "pollo" || ingrediente.getNombre() == "carne" || ingrediente.getNombre() == "chivito" || ingrediente.getNombre() == "chori"])){
				condicionesPreexistentes.add("vegano")
		}
	
	}
	
	def esPublica(){
		creador == null
	}
	
	def tieneIngredientes() {
		ingredientes.size() >=1
	}
		
	

}