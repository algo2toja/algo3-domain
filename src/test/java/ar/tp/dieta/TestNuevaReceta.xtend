package ar.tp.dieta

import org.junit.Before
import org.junit.Test
import org.junit.Assert

class TestNuevaReceta {
	
	Receta nuevaReceta
	Comida zanahoria
	Comida sal
	
	@Before
	def void init(){
		
		zanahoria = new Comida
		sal = new Comida
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
	}

	@Test
	def void tengoIngredientes(){
		Assert.assertFalse(nuevaReceta.ingredientes.empty)
	}
	
	@Test
	def void recetaNoRecomendableParaDiabeticos(){
		Assert.assertTrue(nuevaReceta.(nuevaReceta.inadeacuadaParaCondiciones()).exists[condicion | condicion.esDiabetes()])
		
	}
	

}