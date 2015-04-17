package ar.tp.dieta

import ar.tp.dieta.Condicion

class CondicionHipertension extends Condicion {
	
	override esHipertension(){
		true
	}
	
	override seSubsana(Usuario unUsuario){
		(unUsuario.rutina.rutinaIntensiva())
	}
	
}