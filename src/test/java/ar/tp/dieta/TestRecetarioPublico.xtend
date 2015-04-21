package ar.tp.dieta

import org.junit.Assert
import org.junit.Before
import org.junit.Test

class TestUsuarioInteractuaRecetas {

	Usuario usuarioDePruebas

	RecetarioPublico recetario = new RecetarioPublico

	Receta polloAsado
	Receta papasEspañolas
	
	Comida lechuga = new Comida("lechuga", 1)
	Comida patitas = new Comida("patitas", 232)
	Comida sal = new Comida("sal", 90)
	Comida ajo = new Comida("ajo", 2)

	@Before
	def void init() {

		polloAsado = new Receta => [

			cambiarNombre("pollo asado")
			setCalorias(390)
			setProcesoDePreparacion("	1) Cocinar 2) Comer")
			setDificultadDePreparacion("jodida")
			setTemporadaALaQueCorresponde("jueves santo")

			agregarIngrediente(patitas)
			agregarCondimento(sal)
			agregarCondimento(ajo)
		]
		
		papasEspañolas = new Receta => [

			cambiarNombre("papas españolas")
			setCalorias(10)
			setProcesoDePreparacion("	1) Cocinar 2) Papar")
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
	//Ver si recetario tiene dos recetas
	def void recetarioConDosRecetas(){
		Assert.assertTrue(recetario.recetas.size() == 2)
	
	//Usuario agrega una de esas recetas a su recetario
		usuarioDePruebas.agregarRecetaPublicaAMiColeccion("pollo asado",recetario)
		Assert.assertTrue(usuarioDePruebas.misRecetas.size == 1)
		usuarioDePruebas.modificarReceta("pollo asado","pollito",0,"0","0","0")
		Assert.assertTrue((usuarioDePruebas.devolverReceta("pollito")).devolverNombre() == "pollito")	
		Assert.assertTrue((recetario.elegirReceta("pollo asado")).devolverNombre() == "pollo asado")
		usuarioDePruebas.devolverReceta("pollito").agregarIngrediente(lechuga)
		Assert.assertTrue((usuarioDePruebas.devolverReceta("pollito")).ingredientes.contains(lechuga))	
		Assert.assertFalse((recetario.elegirReceta("pollo asado")).ingredientes.contains(lechuga))
	}
	
}