package ar.tp.dieta

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class CondimentoAzucarado extends Condimento{
	// Asumimos que un condimento no es recomendable solamente para 1 condicion preexistente 
	
	override noRecomendableParaHipertensos() {
		false
	}
	
	override noRecomendableParaDiabeticos() {
		true
	}
	
}