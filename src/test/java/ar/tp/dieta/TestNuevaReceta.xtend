package ar.tp.dieta

import org.junit.Before
import org.junit.Test
import org.junit.Assert

class TestNuevaReceta {

	Receta nuevaReceta
	Ingrediente zanahoria
	Condimento sal
	Condimento azucar

	@Before
	def void init() {

		zanahoria = new Ingrediente
		zanahoria.setCantidad(10)
		
		sal = new CondimentoSalado
		sal.setCantidad(20)
		
		azucar = new CondimentoAzucarado
		azucar.setCantidad(120)

		nuevaReceta = new Receta => [
			setNombreDeLaReceta("Bife")
			setCalorias(500.5)
			setProcesoDePreparacion("1) Cocinar 2) Comer")
			setDificultadDePreparacion("Facil")
			setTemporadaALaQueCorresponde("Navidad")
		]

		nuevaReceta.agregarIngrediente(zanahoria)
		nuevaReceta.agregarCondimento(azucar)
	}

	@Test
	def void tengoIngredientes() {
		Assert.assertFalse(nuevaReceta.ingredientes.empty)
	}

	@Test //Testeando que tenga  solo a diabeticos como condicion no compatible para la receta
	def void recetaNoRecomendable(){
		Assert.assertTrue(nuevaReceta.inadecuadaParaCondiciones().exists[esDiabetes])
		Assert.assertFalse(nuevaReceta.inadecuadaParaCondiciones().exists[esVegano])
		Assert.assertFalse(nuevaReceta.inadecuadaParaCondiciones().exists[esHipertension])
	}

}