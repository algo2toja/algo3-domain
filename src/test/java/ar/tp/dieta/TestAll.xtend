package ar.tp.dieta

import org.junit.Assert
import org.junit.Before
import org.junit.Test

class TestAll {
	
	//Objetos para Usuario
	Usuario nuevoUsuario
	RutinaActiva taeBo

	//Objetos para Receta
	Receta arrozConPollo
	RecetarioPublico recetarioPublico
	Ingrediente arroz
	Ingrediente pollo
	Ingrediente morron
	Ingrediente sal
	Ingrediente caldo
	
	@Before
	def void init(){
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
		
		pollo = new Ingrediente => [
			setCantidad(250)
			setNombre("pollo")
		]

		arroz = new Ingrediente => [
			setCantidad(250)
			setNombre("arroz")
		]

		morron = new Ingrediente =>[
			setCantidad(1)
			setNombre("morron")
		]
		
		sal = new Ingrediente => [
			setCantidad(0)
			setNombre("sal")
		]

		caldo = new Ingrediente =>[
			setCantidad(1)
			setNombre("caldo")
		]	

		arrozConPollo = new Receta => [
			setNombreDeLaReceta("Arroz con Pollo")
			setCalorias(500)
			setProcesoDePreparacion("1)Hervir el arroz y el Pollo 2)Agregar azafran y mezclar 3)Comer")
			setDificultadDePreparacion("Media")
			setTemporadaALaQueCorresponde("Cualquiera")
			agregarIngrediente(pollo)
			agregarIngrediente(arroz)
			agregarCondimento(sal)
		]
		
		recetarioPublico = new RecetarioPublico
		recetarioPublico.agregarReceta(arrozConPollo)
	
	}
	
	@Test
	def void validarUsuario(){
		Assert.assertTrue(nuevoUsuario.validacionUsuario())
	}
	
	@Test
	def void usuarioConRutinaSaludable(){
		Assert.assertTrue(nuevoUsuario.sigoUnaRutinaSaludable())
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
		
		nuevoUsuario.devolverReceta("arroz con llopo").agregarIngrediente(morron)
		nuevoUsuario.devolverReceta("arroz con llopo").agregarCondimento(caldo)
		
		Assert.assertTrue((nuevoUsuario.devolverReceta("arroz con llopo").elementosDeReceta.contains(morron)))
		Assert.assertFalse((recetarioPublico.busquedaReceta("Arroz con Pollo")).elementosDeReceta.contains(morron))
		Assert.assertTrue((nuevoUsuario.devolverReceta("arroz con llopo").elementosDeReceta.contains(caldo)))
		Assert.assertFalse((recetarioPublico.busquedaReceta("Arroz con Pollo")).elementosDeReceta.contains(caldo))
	
		//El usuario es Vegano, el arroz con pollo no le tiene que gustar, o sea que es falso.
		Assert.assertFalse(nuevoUsuario.meConvieneReceta(arrozConPollo))
	}
}