package ar.tp.dieta

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Condimento {
	
	double cantidad
	
	def boolean noRecomendableParaDiabeticos(){
		false	
	}
	
	def boolean noRecomendableParaHipertensos(){
		false
	}
}