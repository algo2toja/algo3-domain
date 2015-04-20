package ar.tp.dieta

import org.junit.Before
import org.junit.Test


class TestNuevoUsuario {

	Usuario usuarioNuevo
	
	@Before
	def void init(){
		usuarioNuevo = new Usuario => [
			setNombre("Carlos")
			setPeso(103.35)
			setAltura(1.75)
		
			//No validan correctamente
			setFechaDeNacimiento(1989, 6, 28) //Nacio el 28 de junio de 1989
			setRutina(new RutinaActiva)
			
			//No valida correctamente
			agregarCondicion(new CondicionVegano)
		]

	}

	@Test
	def void validarUnUsuario(){
		usuarioNuevo.validarUsuario()
	}

	@Test
	def validarCondicion(){
		usuarioNuevo.soyVegano()
	}
 
}