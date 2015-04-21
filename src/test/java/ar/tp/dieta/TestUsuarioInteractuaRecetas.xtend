package ar.tp.dieta

import org.junit.Before
import org.junit.Test
import org.junit.Assert

class TestUsuarioInteractuaRecetas {

	Usuario usuarioNuevo = new Usuario
	
	RecetarioPublico recetario = new RecetarioPublico

	Receta polloAsado = new Receta()
	Receta papasEspañolas = new Receta()

	Comida patitas = new Comida("patitas", 232)
	Comida sal = new Comida("sal", 90)
	Comida ajo = new Comida("ajo", 2)

	@Before
	def void init() {

		polloAsado => [
			setNombreDeLaReceta("pollo asado")
			setCalorias(390)
			setProcesoDePreparacion("	1) Cocinar 2) Comer")
			setDificultadDePreparacion("jodida")
			setTemporadaALaQueCorresponde("jueves santo")
			agregarIngrediente(patitas)
			agregarCondimento(sal)
			agregarCondimento(ajo)
		]

		usuarioNuevo => [
			setNombre("Jose")
			setPeso(90.0)
			setAltura(1.85)
			setFechaDeNacimiento(1966, 3, 17)
			setRutina(new RutinaActiva)
			agregarCondicion(new CondicionVegano)
		]

	}

	@Test
	def void usuarioCreaReceta() {

		usuarioNuevo.crearReceta("Pure", 200, "1) Papar 2) Pisar", "Facil", "Todo el año")
		Assert.assertFalse(usuarioNuevo.misRecetas.empty)
		Assert.assertTrue(usuarioNuevo.misRecetas.exists[receta|receta.devolverNombre() == "Pure"])
	}

	@Test
	def void modificaReceta() {

		usuarioNuevo.crearReceta("Pure", 200, "1) Papar 2) Pisar", "Facil", "Todo el año")
		usuarioNuevo.modificarReceta("Pure", "Papada", 0, "0", "0", "0")
		Assert.assertTrue((usuarioNuevo.devolverReceta("Papada")).devolverNombre() == "Papada")

	}
	@Test
	def void modificaRecetaPublica() {
		
		usuarioNuevo.modificarReceta(polloAsado.getNombreDeLaReceta(), "Pollo a la parrilla", 0, "0", "0", "0")
		Assert.assertTrue((usuarioNuevo.devolverReceta("Pollo a la parrilla")).devolverNombre() == "Pollo a la parrilla")

	}
	
	

}
