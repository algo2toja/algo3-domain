package ar.tp.dieta

import ar.tp.dieta.Condicion

class CondicionDiabetes extends Condicion {

	override esDiabetes(){
		true
	}
	
	override seSubsana(Usuario unUsuario){
		(unUsuario.rutina == "activa" || unUsuario.rutina == "activa con ejercicio" || unUsuario.peso <= 70)
	}

}