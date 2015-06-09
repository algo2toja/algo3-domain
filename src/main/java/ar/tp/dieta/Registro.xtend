package ar.tp.dieta

import java.util.HashMap
import java.util.Map
import java.util.List
import java.util.ArrayList

//////////////////////////////////LLEVA EL REGISTRO DE LAS CONSULTAS//////////////////

class Registro {
	
	List <String> nombresRecetas = new ArrayList<String>
	
	Map<String,Integer> consultasRealizadas = new HashMap<String,Integer>()
	Map<String,Integer> consultasRealizadasPorHombre = new HashMap<String,Integer>()
	Map<String,Integer> consultasRealizadasPorMujeres = new HashMap<String,Integer>()
	Map<Integer,Integer> consultasRealizadasPorHora = new HashMap<Integer,Integer>()
	int contadorVeganos = 0
	
	def incrementarBusquedaPorHombre(String nombreReceta) {
		this.actualizarMap(consultasRealizadasPorHombre,nombreReceta)
	}
	
	def incrementarBusquedaPorMujer(String nombreReceta) {
		this.actualizarMap(consultasRealizadasPorMujeres, nombreReceta)
	}
	
	def incrementarBusqueda(String nombreReceta) {
		this.actualizarMap(consultasRealizadas, nombreReceta)
	}

	def protected actualizarMap(Map<String, Integer> elMap, String nombreReceta) {
		var clave = nombreReceta
		if (!elMap.containsKey(clave)) {
			elMap.put(clave, 1)
		} else {
			var Integer valorActualizado = elMap.get(clave) + 1
			elMap.put(clave, valorActualizado)
		}
	}
	
	def agregarNobreDeReceta(String nombreReceta) {
		nombresRecetas.add(nombreReceta)
	}
	
	def incrementarBusquedaPorVegano() {
		contadorVeganos ++ 
	}
	
	def incrementarConsultaPorHora(int hora) {
		if(!consultasRealizadasPorHora.containsKey(hora)){
			consultasRealizadasPorHora.put(hora,1)
		}else{
			consultasRealizadasPorHora.put(hora,consultasRealizadasPorHora.get(hora)+1)
		}
	
	}
	
	def public recetaMasConsultada(){
		masConsultada(consultasRealizadas)
	}
	
	def public cantidadDeVeganosQueConsultaron(){
		contadorVeganos
	}
	
	def public recetaMasConsultadaPorHora(){
		var int i
		var int horaMaxima
		var int valorMaximo
		
		for(i= 0; i<24 ; i++){
			if (consultasRealizadasPorHora.get(i) > valorMaximo) {
				horaMaxima = i
				valorMaximo = consultasRealizadasPorHora.get(i)
			}
		}
		horaMaxima
	}
	
	def public recetasMasConsultadasHombres() {
		masConsultada(consultasRealizadasPorHombre)
	}

	def public recetasMasConsultadasMujeres() {
		masConsultada(consultasRealizadasPorMujeres)

	}

	def protected masConsultada(Map<String, Integer> unMap) {
		var int i = 0
		var Integer valorMaximo = 0
		var String nombreMaximo
		for (i = 0; i < nombresRecetas.size; i++) {
			if (unMap.get(nombresRecetas.get(i)) > valorMaximo) {
				valorMaximo = unMap.get(nombresRecetas.get(i))
				nombreMaximo = nombresRecetas.get(i)
			}
		}
		nombreMaximo
	}
	
}