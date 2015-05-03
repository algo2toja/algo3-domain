package ar.tp.dieta

import ar.tp.dieta.Condicion

class CondicionDiabetes extends Condicion {

	val String[] elementosNoRecomendables = #["azucar"] //Lista de "elementos" que no son buenos para una condicion

	override esDiabetes() {
		true
	}

	override seSubsana(Usuario unUsuario) {
		(unUsuario.rutinaEsActiva || unUsuario.getPeso <= 70.0)
	}
	
	override validarCondicion(Usuario unUsuario){
		//Si el usuario no indicó sexo, la condicion devuelve true (el usuario debe indicar sexo)
		unUsuario.sexo.equals(null) && !unUsuario.preferencias.empty
	}

	override ingredienteEsInadecuado(ElementoDeReceta unElemento) {
		//Si el elemento es azucar y su cantidad es mayor a 100 gr no es recomendable para diabeticos
		(elementosNoRecomendables.contains(unElemento.getNombre()) && unElemento.getCantidad()>100)
	}
}