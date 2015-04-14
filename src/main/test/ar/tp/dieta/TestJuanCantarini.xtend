package ar.tp.dieta

import org.junit.Assert
import org.junit.Before
import org.junit.Test

class TestJuanCantarini {
	
	Usuario JuanCantarini
	
	@Before
	def void init(){
		JuanCantarini = new Usuario => [
			setPeso(74.8)
			setAltura(1.83)
		]
	}
	
	@Test
	def void casoDePruebaCantarini(){
		Assert.assertEquals(22.3, JuanCantarini.indiceDeMasaCorporal, 0.5)
	}
	
}
