package ar.tp.dieta

import org.junit.Assert
import org.junit.Before
import org.junit.Test

class TestGabrielPerez {
	
	Usuario gabo
	
	@Before
	def void init(){
		Gabo = new Usuario => [ setPeso(76) setAltura(1.82)]
	}
	
	@Test
	def void usuarioCalculaSuIMCconExito(){
		Assert.assertEquals(24, gabo.indiceDeMasaCorporal, 0.2)
	}
	
}
