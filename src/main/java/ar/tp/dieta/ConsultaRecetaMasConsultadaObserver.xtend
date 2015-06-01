package ar.tp.dieta

import java.util.HashMap
import java.util.Map

class ConsultaRecetaMasConsultadaObserver implements ConsultaObserver{
	
	Map<String,Integer> recetasMasConsultadas = new HashMap<String,Integer>()
	
	override actualizar(Usuario usuario,Receta receta){
		if(!recetasMasConsultadas.containsKey(receta.getNombre())){
			recetasMasConsultadas.put(receta.getNombre(),1)
		}else{
			recetasMasConsultadas.put(receta.getNombre(),recetasMasConsultadas.get(receta.getNombre())+1)
		}
	}
	
	
}