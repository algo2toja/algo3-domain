package ar.tp.dieta

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class CondimentoSalado extends Condimento{

	override noRecomendableParaHipertensos() {
		if(cantidad !=0){
			true
	}else{false}
	
	}
	
	override noRecomendableParaDiabeticos() {
		false
	}
}