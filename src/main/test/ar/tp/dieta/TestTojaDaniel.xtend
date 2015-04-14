package ar.tp.dieta

import org.junit.Assert
import org.junit.Before
import org.junit.Test

class TestTojaDaniel {
	

	Usuario TojaDaniel
	
	@Before
	def void init(){
		TojaDaniel = new Usuario => [
			setPeso(120.1)
			setAltura(1.79)
		]
	}
	
	@Test
	def void casoDePruebaToja(){
		Assert.assertEquals(37.5, TojaDaniel.indiceDeMasaCorporal, 0.5)
	}
	
}
