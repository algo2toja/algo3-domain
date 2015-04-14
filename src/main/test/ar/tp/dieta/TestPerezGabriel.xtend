package ar.tp.dieta

import org.junit.Assert
import org.junit.Before
import org.junit.Test

class TestTojaDaniel {
	
	Usuario Gabo
	
	@Before
	def void init(){
		Gabo = new Usuario => [ setPeso(76) setAltura(1.82)]
	}
	
	@Test
	def void casoDePruebaToja(){
		Assert.assertEquals(24, TojaDaniel.indiceDeMasaCorporal, 0.2)
	}
	
}
