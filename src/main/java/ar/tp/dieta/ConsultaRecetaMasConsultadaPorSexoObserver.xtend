package ar.tp.dieta

import java.util.ArrayList
import java.util.HashMap
import java.util.List
import java.util.Map
import queComemos.entrega3.repositorio.BusquedaRecetas

class ConsultaRecetaMasConsultadaPorSexoObserver implements ConsultaObserver {

	List<String> nombresRecetas = new ArrayList<String>
	protected String nombreMaximo

	Map<String, Integer> recetasMasConsultadasPorHombres = new HashMap<String, Integer>()
	Map<String, Integer> recetasMasConsultadasPorMujeres = new HashMap<String, Integer>()

	override actualizar(Usuario usuario, List<String> nombres, BusquedaRecetas busqueda) {
		
		nombres.forEach[ nombre |
			 
		if (usuario.getSexo.equals("F")) {
			actualizarMap(recetasMasConsultadasPorMujeres, nombre)
		} else {
			actualizarMap(recetasMasConsultadasPorHombres, nombre)
		}
		nombresRecetas.add(nombre)
		
		]
	}

	def protected actualizarMap(Map<String, Integer> elMap, String nombre) {
		var clave = nombre
		if (!elMap.containsKey(clave)) {
			elMap.put(clave, 1)
		} else {
			var Integer valorActualizado = elMap.get(clave) + 1
			elMap.put(clave, valorActualizado)
		}
	}

	def public recetasMasConsultadasHombres() {
		masConsultada(recetasMasConsultadasPorHombres)
	}

	def public recetasMasConsultadasMujeres() {
		masConsultada(recetasMasConsultadasPorMujeres)

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
}