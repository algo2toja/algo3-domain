package ar.tp.dieta

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class CondimentoSalado extends Condimento{

	override noRecomendableParaHipertensos() {
		true
	}
	
	override noRecomendableParaDiabeticos() {
		false
	}
}