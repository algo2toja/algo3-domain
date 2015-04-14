package ar.tp.dieta

import ar.tp.dieta.Usuario
import org.junit.Assert
import org.junit.Before
import org.junit.Test

class TestMiguelGagliardo {

	Usuario MiguelGagliardo
	
	@Before
	def void init(){
		MiguelGagliardo = new Usuario => [
			setPeso(103.35)
			setAltura(1.75)
		]
	}
	
	@Test
	def void casoDePruebaGagliardo(){
		Assert.assertEquals(33.5, MiguelGagliardo.indiceDeMasaCorporal, 0.5)
	}
	
}