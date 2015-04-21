package ar.tp.dieta

import org.junit.Before
import org.junit.Test
import org.junit.Assert

class TestNuevaReceta {
	
	Receta nuevaReceta
	Comida zanahoria
	Comida sal
	
	Comida azucar
	
	@Before
	def void init(){
		
		zanahoria = new Comida("zanahoria",10)
		sal = new Comida("sal",20)
		azucar = new Comida("azucar", 120)
		
		nuevaReceta = new Receta => [
			setNombreDeLaReceta("Bife")
			setCalorias(500.5)
			setProcesoDePreparacion("1) Cocinar
						2) Comer")
			setDificultadDePreparacion("Facil")
			setTemporadaALaQueCorresponde("Navidad")				
		]
		
		nuevaReceta.agregarIngrediente(zanahoria)
		nuevaReceta.agregarCondimento(sal)
		
		nuevaReceta.agregarCondimento(azucar)
	}

	@Test
	def void tengoIngredientes(){
		Assert.assertFalse(nuevaReceta.ingredientes.empty)
	}
	
	@Test
	def void recetaNoRecomendableParaDiabeticos(){
		Assert.assertTrue(nuevaReceta.inadecuadaParaCondiciones().exists[esDiabetes])

	}
	

}