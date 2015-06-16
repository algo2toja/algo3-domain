package ar.tp.dieta

import org.junit.Before
import org.junit.Test
import org.junit.Assert

class TestEntregaDosConBuilder extends TestRepoRecetas {
	
	Usuario nuevoUsuario
	RutinaActiva taeBo
	
	@Before
	def void initRecetas(){
		
		taeBo = new RutinaActiva => [
			setTiempoDeEjercicio(90)
		]
		
		nuevoUsuario = new Usuario() =>[
			setPeso(105.3)
			setAltura(1.75)
			setFechaDeNacimiento(1985, 4, 13) // Nacio el 13 de Abril de 1985
			setSexo("Masculino")
			setNombre("Marco")
			setRutina(taeBo)
			agregarCondicion(new CondicionVegano)
			agregarPreferencia("fruta")
		]
	}
	
	@Test
	def void validarUnUsuario() {
		Assert.assertTrue(nuevoUsuario.validarCampos())
		Assert.assertTrue(nuevoUsuario.validacionUsuario())
			
	}

	@Test //Prueba condicion vegano e hipertension subsanadas
	def void usuarioConRutinaSaludable() {
		Assert.assertFalse(nuevoUsuario.sigoUnaRutinaSaludable())
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