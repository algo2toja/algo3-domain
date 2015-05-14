package ar.tp.dieta

import org.junit.Assert
import org.junit.Before
import org.junit.Test

class TestEntregaUno3 {

	Usuario usuarioNuevo
	Usuario usuarioSinNombre
	Usuario usuarioNuevo2
	RutinaSedentaria rutinaSedentaria
	RutinaActiva rutinaIntensiva

	@Before
	def void init() {
		
		rutinaSedentaria = new RutinaSedentaria
		rutinaSedentaria.setTiempoDeEjercicio(0)
		
		rutinaIntensiva = new RutinaActiva
		rutinaIntensiva.setTiempoDeEjercicio(90)
		
		usuarioNuevo = new Usuario => [
			setNombre("Carlos")
			setPeso(150.10)
			setAltura(1.75)

			setFechaDeNacimiento(1989, 6, 28)
			setRutina(rutinaSedentaria)	
			agregarCondicion(new CondicionVegano)
			agregarPreferencia("chori")
			agregarPreferencia("fruta")
			
			
		]
		
		usuarioNuevo2 = new Usuario => [
			setNombre("Miguel")
			setPeso(150.35)
			setAltura(1.75)

			setFechaDeNacimiento(1989, 6, 28)
			setRutina(rutinaIntensiva)
			agregarCondicion(new CondicionHipertension)
			agregarPreferencia("fruta")
			
		]

		usuarioSinNombre = new Usuario => [
			setPeso(85.6)
			setAltura(1.81)

			setFechaDeNacimiento(1930, 3, 15) // Nacio el 15 de Marzo de 1930
			setRutina(rutinaIntensiva)
			agregarCondicion(new CondicionHipertension)
		]

	}

	@Test
	def void validarUnUsuario() {
		Assert.assertTrue(usuarioNuevo.validarCampos())
		Assert.assertTrue(usuarioNuevo.validacionUsuario())
			
	}

	@Test(expected=typeof(NullPointerException))
	def void usuarioSinNombreNoSeValida() {
		//NullPointer ya que no tiene nombre
		usuarioSinNombre.validarCampos()
	}

	@Test //Prueba condicion vegano e hipertension subsanadas
	def void usuarioConRutinaSaludable() {
		Assert.assertTrue(usuarioNuevo.sigoUnaRutinaSaludable())
		Assert.assertTrue(usuarioNuevo2.sigoUnaRutinaSaludable())
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

}