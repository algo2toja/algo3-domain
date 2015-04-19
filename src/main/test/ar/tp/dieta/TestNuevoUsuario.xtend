package ar.tp.dieta

import org.junit.Assert
import org.junit.Before
import org.junit.Test


class TestNuevoUsuario {

	Usuario usuarioNuevo
	
	@Before
	def void init(){
		
		usuarioNuevo = new Usuario => [
			setPeso(103.35)
			setAltura(1.75)
			agregarCondicion(new CondicionDiabetes)
			//setFechaNacimiento() como poner una fecha
			setSexo("M")
			setNombre("Juan")
			establecerRutina(new RutinaLeve)
			agregarPreferencia("Carne")
			agregarComidaQueNoMeGusta("Fruta")
			
		]

	}
	
	@Test
	def void casoDePruebaGagliardo(){
		Assert.assertEquals(33.5, usuarioNuevo.indiceDeMasaCorporal, 0.5)
	}
	/*
	@Test
	def boolean testeoDiabetes(){
		usuarioNuevo.soyDiabetico()
	} */
	
}