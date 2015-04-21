package ar.tp.dieta

import ar.tp.dieta.Condicion

class CondicionVegano extends Condicion {
	override esVegano() {
		true
	}

	override seSubsana(Usuario unUsuario) {
		(unUsuario.meGustaComida("fruta")
		)
	}
}