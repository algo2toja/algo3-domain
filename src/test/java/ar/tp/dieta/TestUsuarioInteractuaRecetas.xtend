package ar.tp.dieta

import org.junit.Assert
import org.junit.Before
import org.junit.Test

class TestUsuarioInteractuaRecetas {

	Usuario usuarioDePruebas
	
	RecetarioPublico recetario = new RecetarioPublico

	Receta polloAsado 
	Receta papasEspañolas

	Ingrediente patitas
	Ingrediente sal
	Ingrediente ajo
	
	@Before
	def void init() {

		patitas = new Ingrediente =>[
			setCantidad(232)
			setNombre("patitas")
		]

		sal = new Ingrediente => [
			setCantidad(90)
			setNombre("sal")
		]
		
		ajo = new Ingrediente => [
			setCantidad(2)
			setNombre("ajo")
		]
		
		polloAsado = new Receta => [

			cambiarNombre("pollo asado")
			setCalorias(390)
			setProcesoDePreparacion("1) Cocinar 2) Comer")
			setDificultadDePreparacion("jodida")
			setTemporadaALaQueCorresponde("jueves santo")
			agregarIngrediente(patitas)
			agregarCondimento(sal)
			agregarCondimento(ajo)
		]
		
		papasEspañolas = new Receta => [

			cambiarNombre("papas españolas")
			setCalorias(10)
			setProcesoDePreparacion("1) Cocinar 2) Papar")
			setDificultadDePreparacion("extrema")
			setTemporadaALaQueCorresponde("Todo el año")

			agregarIngrediente(patitas)
			agregarCondimento(sal)
			agregarCondimento(ajo)
		]
		
		usuarioDePruebas = new Usuario => [

			setNombre("Jose")
			setPeso(90.0)
			setAltura(1.85)
			setFechaDeNacimiento(1966, 3, 17)
			setRutina(new RutinaActiva)
			agregarCondicion(new CondicionVegano)
		]
		
		recetario.agregarReceta(polloAsado)
		recetario.agregarReceta(papasEspañolas)
		
	}
	
	@Test
	def void recetarioConDosRecetas(){
		//Ver si recetario tiene dos recetas
		Assert.assertTrue(recetario.recetas.size().equals(2))
	
		//Usuario agrega una de esas recetas a su recetario
		usuarioDePruebas.agregarRecetaPublicaAMiColeccion("pollo asado", recetario)
		Assert.assertTrue(usuarioDePruebas.misRecetas.size.equals(1))
		
		usuarioDePruebas.modificarReceta("pollo asado", "Pollo Asado", 1500, "1)Cocinar 2)Comer", "Dificil", "Cualquiera")
		
		//La receta ahora existe como "Pollo Asado" en la colección del usuario.
		Assert.assertTrue((usuarioDePruebas.devolverReceta("Pollo Asado")).devolverNombre().equals("Pollo Asado"))
		
		//Verifico que se generó una copia de esa receta y no se modificó la original (En recetario)
		Assert.assertTrue((recetario.elegirReceta("pollo asado")).devolverNombre().equals("pollo asado"))
	}

}

