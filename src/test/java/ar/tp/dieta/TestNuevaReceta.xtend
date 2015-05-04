package ar.tp.dieta

import org.junit.Before
import org.junit.Test
import org.junit.Assert

class TestNuevaReceta {

	Receta nuevaReceta
	Ingrediente zanahoria
	Ingrediente sal
	Ingrediente azucar

	@Before
	def void init() {

		zanahoria = new Ingrediente
		zanahoria.setCantidad(10)
		
		sal = new Ingrediente
		sal.setCantidad(20)
		
		azucar = new Ingrediente =>[
			setNombre("azucar")
			setCantidad(120)
		]
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
		Assert.assertFalse(nuevaReceta.elementosDeReceta.empty)
	}
}