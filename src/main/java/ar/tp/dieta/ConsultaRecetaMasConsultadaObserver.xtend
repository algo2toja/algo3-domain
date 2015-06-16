package ar.tp.dieta

import java.util.ArrayList
import java.util.HashMap
import java.util.List
import java.util.Map
import queComemos.entrega3.repositorio.BusquedaRecetas

class ConsultaRecetaMasConsultadaObserver implements ConsultaObserver{
	
	public Map<String,Integer> recetasMasConsultadas = new HashMap<String,Integer>()
	List<String> nombresRecetas = new ArrayList<String>
	public String nombreMaximo
	
	
	override actualizar(Usuario usuario,List<String> nombres, BusquedaRecetas busqueda){
		
		nombres.forEach[nombre | 
			
		if(!recetasMasConsultadas.containsKey(nombre)){
			recetasMasConsultadas.put(nombre,1)
			nombresRecetas.add(nombre)
		}else{
			recetasMasConsultadas.put(nombre,recetasMasConsultadas.get(nombre)+1)
		}
		
		]
	}
	
	def public recetaMasConsultada(){
		masConsultada(recetasMasConsultadas)
	}
	
	def protected masConsultada(Map<String, Integer> unMap) {
		var int i = 0
		var Integer valorMaximo = 0
		for (i = 0; i < nombresRecetas.size; i++) {
			if (unMap.get(nombresRecetas.get(i)) > valorMaximo) {
				valorMaximo = unMap.get(nombresRecetas.get(i))
				nombreMaximo = nombresRecetas.get(i)
			}
		}
		nombreMaximo
	}
	
	def public mostrarRecetaMasConsultada(){
		nombreMaximo
	}
	
}