package ar.tp.dieta

import java.util.HashMap
import java.util.Map

class RecetaMasConsultadaObserver implements ConsultaObserver {

	Map<String, Integer> recetasMasConsultadasPorHombres = new HashMap<String, Integer>()
	Map<String, Integer> recetasMasConsultadasPorMujeres = new HashMap<String, Integer>()

	override actualizar(Usuario usuario, Receta receta) {
		if (usuario.getSexo.equals("F")) {
			actualizarMap(recetasMasConsultadasPorMujeres, receta)
		} else {
			actualizarMap(recetasMasConsultadasPorHombres, receta)
		}

	}

	def private actualizarMap(Map<String, Integer> elMap, Receta receta) {
		var clave = receta.nombreDeLaReceta
		if (!elMap.containsKey(clave)) {
			elMap.put(clave, 1)
		} else {
			var Integer valorActualizado = elMap.get(clave) + 1
			elMap.put(clave, valorActualizado)
		}
	}

	def public recetasMasConsultadasHombres() {
		masConsultadas(recetasMasConsultadasPorHombres)
	}

	def public recetasMasConsultadasMujeres() {
		masConsultadas(recetasMasConsultadasPorMujeres)
	}

	def protected masConsultadas(Map<String, Integer> unMap) {
		//ordena el map y lo devuelve
	}
}