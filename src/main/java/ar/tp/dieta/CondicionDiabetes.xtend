package ar.tp.dieta

import ar.tp.dieta.Condicion

class CondicionDiabetes extends Condicion {

	override esDiabetes() {
		true
	}

	override seSubsana(Usuario unUsuario) {
		(unUsuario.rutinaEsActiva || unUsuario.getPeso <= 70.0)
	}
	
	override validarCondicion(Usuario unUsuario){
		if(unUsuario.sexo == null || unUsuario.preferencias.empty){
			throw new BusinessException("El usuario es diabetico y no ingreso sexo, o no tiene preferencias")
		}else{true}
	}

}