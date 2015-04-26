package ar.tp.dieta

import ar.tp.dieta.Preferencia

class Carne implements Preferencia {
	override meGustaLaFruta(){
		false
	}
	override meGustaLaCarne(){
		true
	}
}