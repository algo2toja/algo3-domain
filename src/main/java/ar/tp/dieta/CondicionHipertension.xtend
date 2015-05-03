package ar.tp.dieta

import ar.tp.dieta.Condicion

class CondicionHipertension extends Condicion {

	val String[] elementosNoRecomendables = #["sal", "caldo"] //Lista de "elementos" que no son buenos para una condicion

	override esHipertension() {
		true
	}

	override seSubsana(Usuario unUsuario) {
		(unUsuario.rutinaEsIntensiva())
	}

	override validarCondicion(Usuario unUsuario){
		!(unUsuario.preferencias.empty)
	}

	override ingredienteEsInadecuado(ElementoDeReceta unElemento) {
		elementosNoRecomendables.contains(unElemento.getNombre())
	}
}