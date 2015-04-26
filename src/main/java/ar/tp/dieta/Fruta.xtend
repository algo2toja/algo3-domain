package ar.tp.dieta

import ar.tp.dieta.Preferencia

class Fruta implements Preferencia {
	override meGustaLaFruta(){
		true
	}
	override meGustaLaCarne(){
		false
	}
}