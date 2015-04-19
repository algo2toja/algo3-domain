package ar.tp.dieta

import org.junit.Before
import org.junit.Test

class TestNuevaReceta {
	
	Receta nuevaReceta
	Comida zanahoria
	
	@Before
	def void init(){
		
		zanahoria = new Comida
		nuevaReceta = new Receta => [
			setNombre("Bife")
			setCalorias(500.5)
			setProceso("1) Cocinar
						2) Comer")
			setDificultad("Facil")
			setTemporada("Navidad")				
		]
		
		nuevaReceta.agregarIngrediente(zanahoria)
	}

	@Test
	def void tengoIngredientes(){
		!(nuevaReceta.ingredientes.empty)
	}

}