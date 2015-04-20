package ar.tp.dieta

import org.junit.Before
import org.junit.Test
import org.junit.Assert

class TestNuevoUsuario {

	Usuario usuarioNuevo
	Usuario usuarioSinNombre
	
	@Before
	def void init(){
		usuarioNuevo = new Usuario => [
			setNombre("Carlos")
			setPeso(103.35)
			setAltura(1.75)
		
			setFechaDeNacimiento(1989, 6, 28) //Nacio el 28 de junio de 1989
			setRutina(new RutinaIntensiva)
			
			agregarCondicion(new CondicionHipertension)
		]
		
		usuarioSinNombre = new Usuario =>[
			setPeso(85.6)
			setAltura(1.81)
		
			setFechaDeNacimiento(1930, 3, 15) //Nacio el 28 de junio de 1989
			setRutina(new RutinaIntensiva)
			
			agregarCondicion(new CondicionHipertension)
		]

	}

	@Test
	def void validarUnUsuario(){
		usuarioNuevo.validarUsuario()
	}
	
	@Test (expected=typeof (IllegalArgumentException))
	def void usuarioSinNombreNoSeValida(){ //Intentamos validar sin nombre, los demas requisitos se construyen igual.
		usuarioSinNombre.validarUsuario()
	}
	
	// @Test del IMC
	@Test
	def void usuarioConRutinaSaludable(){
		Assert.assertTrue(usuarioNuevo.sigoUnaRutinaSaludable())
	}
 
 	 	
}