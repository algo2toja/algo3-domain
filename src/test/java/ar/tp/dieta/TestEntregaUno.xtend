package ar.tp.dieta

import org.junit.Assert
import org.junit.Test

class TestEntregaUno extends TestRepositorio{
	
	// TESTEADO OK
	
	@Test
	def void usuarioConRutinaSaludable(){
		Assert.assertTrue(usuarioVegano.sigoUnaRutinaSaludable())
		Assert.assertTrue(usuarioHipertenso.sigoUnaRutinaSaludable())
	}

	@Test
	def void usuarioCreaReceta() {
		usuarioSinCondicion.crearReceta("Pure", 200, "1) Papar 2) Pisar", "Facil", "Todo el año")
		Assert.assertFalse(usuarioSinCondicion.misRecetas.empty)
		Assert.assertTrue(usuarioSinCondicion.misRecetas.exists[ receta | receta.devolverNombre().equals("Pure")])
	}

	@Test
	def void modificaReceta() {
		usuarioSinCondicion.crearReceta("Pure", 200, "1) Papar 2) Pisar", "Facil", "Todo el año")
		usuarioSinCondicion.modificarReceta("Pure", "Papada", 0, "0", "0", "0")
		Assert.assertTrue((usuarioSinCondicion.devolverReceta("Papada")).devolverNombre().equals("Papada"))
	}
	
	@Test
	def void usuarioModificaRecetaPublica() {
		usuarioSinCondicion.recetario = recetarioPublico
		usuarioSinCondicion.agregarRecetaPublicaAMiColeccion("Arroz con Pollo")
		usuarioSinCondicion.modificarReceta("Arroz con Pollo", "arroz con llopo", 200, "1)Cocinar 2)Comer", "facil", "invierno")
		
		//Verifica si el nombre de la receta fue modificado en la coleccion de recetas del usuario.
		Assert.assertTrue(usuarioSinCondicion.devolverReceta("arroz con llopo").getNombreDeLaReceta.equals("arroz con llopo"))
		
		//Verifica si el nombre de la receta se mantiene en la coleccion de recetas publicas
		Assert.assertTrue((recetarioPublico.busquedaReceta("Arroz con Pollo")).getNombreDeLaReceta.equals("Arroz con Pollo"))
	
		//Verifica si el ingrediente y el condimento solo se agrego en la receta del usuario y no en la publica
		usuarioSinCondicion.devolverReceta("arroz con llopo").agregarIngrediente(manteca)
		usuarioSinCondicion.devolverReceta("arroz con llopo").agregarCondimento(sal)
		
		Assert.assertTrue((usuarioSinCondicion.devolverReceta("arroz con llopo").elementosDeReceta.contains(manteca)))
		Assert.assertFalse((recetarioPublico.busquedaReceta("Arroz con Pollo")).elementosDeReceta.contains(manteca))
		Assert.assertTrue((usuarioSinCondicion.devolverReceta("arroz con llopo").elementosDeReceta.contains(sal)))
		Assert.assertFalse((recetarioPublico.busquedaReceta("Arroz con Pollo")).elementosDeReceta.contains(sal))
	
		//El usuario es Vegano, el arroz con pollo no le tiene que gustar, o sea que es falso.
		Assert.assertFalse(usuarioVegano.meConvieneReceta(lomoMostaza))
	}

}