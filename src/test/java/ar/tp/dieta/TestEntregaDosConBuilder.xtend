package ar.tp.dieta

import org.junit.Before
import org.junit.Test
import org.junit.Assert

class TestEntregaDosConBuilder {
	
	TestRepoRecetas repoRecetas
	Usuario nuevoUsuario
	RutinaActiva taeBo
	
	@Before
	def void init(){
		repoRecetas = new TestRepoRecetas
		repoRecetas.init()
		
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
	def void usuarioModificaRecetaPublica() {
	
		nuevoUsuario.agregarRecetaPublicaAMiColeccion("Arroz con Pollo")
		nuevoUsuario.modificarReceta("Arroz con Pollo", "arroz con llopo", 200, "1)Cocinar 2)Comer", "facil", "invierno")
		
		//Verifica si el nombre de la receta fue modificado en la coleccion de recetas del usuario.
		Assert.assertTrue(nuevoUsuario.devolverReceta("arroz con llopo").getNombreDeLaReceta.equals("arroz con llopo"))
		
		//Verifica si el nombre de la receta se mantiene en la coleccion de recetas publicas
		Assert.assertTrue((recetarioPublico.busquedaReceta("Arroz con Pollo")).getNombreDeLaReceta.equals("Arroz con Pollo"))
	
		//Verifica si el ingrediente y el condimento solo se agrego en la receta del usuario y no en la publica
		
		
		Assert.assertTrue((nuevoUsuario.devolverReceta("arroz con llopo").elementosDeReceta.contains(arroz)))
		Assert.assertFalse((recetarioPublico.busquedaReceta("Arroz con Pollo")).elementosDeReceta.contains(pollo))
	
		//El usuario es Vegano, el arroz con pollo no le tiene que gustar, o sea que es falso.
		Assert.assertFalse(nuevoUsuario.meConvieneReceta(arrozConPollo))
	}
}