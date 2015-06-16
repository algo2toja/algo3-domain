package ar.tp.dieta

import org.junit.Test
import org.junit.Assert

class TestEntregaDosConBuilder extends TestRepoRecetas {
	
	Usuario nuevoUsuario
	//RutinaActiva taeBo
	
	@Test //Prueba condicion vegano e hipertension subsanadas
	def void usuarioConRutinaSaludable() {
		Assert.assertFalse(usuarioMiguel.sigoUnaRutinaSaludable())
	}

	@Test
	def void usuarioCreaReceta() {

		nuevoUsuario.crearReceta("Pure", 200, "1) Papar 2) Pisar", "Facil", "Todo el año")
		Assert.assertFalse(nuevoUsuario.misRecetas.empty)
		Assert.assertTrue(nuevoUsuario.misRecetas.exists[receta|receta.devolverNombre() == "Pure"])
	}

	@Test
	def void modificaReceta() {

		nuevoUsuario.crearReceta("Pure", 200, "1) Papar 2) Pisar", "Facil", "Todo el año")
		nuevoUsuario.modificarReceta("Pure", "Papada", 0, "0", "0", "0")
		Assert.assertTrue((nuevoUsuario.devolverReceta("Papada")).devolverNombre() == "Papada")

	}

}