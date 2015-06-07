package ar.tp.dieta

import java.util.ArrayList
import java.util.HashMap
import java.util.List
import java.util.Map

class ConsultaRecetaMasConsultadaObserver implements ConsultaObserver{
	
	public Map<String,Integer> recetasMasConsultadas = new HashMap<String,Integer>()
	List<String> nombresRecetas = new ArrayList<String>
	public String nombreMaximo
	
	
	override actualizar(Usuario usuario,queComemos.entrega3.dominio.Receta receta){
		
		if(!recetasMasConsultadas.containsKey(receta.getNombre())){
			recetasMasConsultadas.put(receta.getNombre(),1)
			nombresRecetas.add(receta.getNombre())
		}else{
			recetasMasConsultadas.put(receta.getNombre(),recetasMasConsultadas.get(receta.getNombre())+1)
		}
		
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