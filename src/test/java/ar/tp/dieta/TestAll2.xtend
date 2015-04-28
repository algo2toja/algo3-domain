package ar.tp.dieta

import org.junit.Assert
import org.junit.Before
import org.junit.Test

class TestAll2 {
	
	//Objetos para Usuario
	Usuario nuevoUsuario
	Carne chori
	Fruta manzana
	RutinaSedentaria taebo

	//Objetos para Receta
	Receta arrozConPollo
	RecetarioPublico recetarioPublico
	Ingrediente arroz
	Ingrediente pollo
	Ingrediente zanahoria
	Condimento sal
	Condimento caldo
	
	@Before
	def void init(){
		taebo = new RutinaSedentaria => [
			setTiempoDeEjercicio(90)
		]
		
		chori = new Carne
		manzana = new Fruta
		
		nuevoUsuario = new Usuario =>[
			setPeso(106.2)
			setAltura(1.95)
			setFechaDeNacimiento(1985, 4, 13) // Nacio el 28 de junio de 1989
			//setSexo("Masculino")
			setNombre("Marco")
			setRutina(taebo)
			agregarCondicion(new CondicionDiabetes)
			agregarPreferencia(chori)
			agregarPreferencia(manzana)
		]
		
		pollo = new IngredienteCarne
		pollo.setCantidad(250)
		
		arroz = new Ingrediente
		arroz.setCantidad(250)
		
		zanahoria = new Ingrediente
		zanahoria.setCantidad(1)
		
		sal = new CondimentoSalado
		sal.setCantidad(0)
		
		caldo = new CondimentoSalado
		caldo.setCantidad(1)
				
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
	def void validarUnUsuario() {
		Assert.assertTrue(nuevoUsuario.validacionUsuario())	
	}
	
	@Test(expected=typeof(BusinessException))
	def void usuarioConRutinaSaludable(){
		Assert.assertTrue(nuevoUsuario.sigoUnaRutinaSaludable())
	}

	@Test
	def void usuarioModificaRecetaPublica() {
		nuevoUsuario.agregarRecetaPublicaAMiColeccion("Arroz con Pollo", recetarioPublico)
		nuevoUsuario.modificarReceta("Arroz con Pollo", "arroz con llopo", 200, "1)Cocinar 2)Comer", "facil", "invierno")
		
		//Verifica si el nombre de la receta fue modificado en la coleccion de recetas del usuario.
		Assert.assertTrue(nuevoUsuario.devolverReceta("arroz con llopo").getNombreDeLaReceta.equals("arroz con llopo"))
		
		//Verifica si el nombre de la receta se mantiene en la coleccion de recetas publicas
		Assert.assertTrue((recetarioPublico.busquedaReceta("Arroz con Pollo")).getNombreDeLaReceta.equals("Arroz con Pollo"))
	
		//Verifica si el ingrediente y el condimento solo se agrego en la receta del usuario y no en la publica
		
		nuevoUsuario.devolverReceta("arroz con llopo").agregarIngrediente(zanahoria)
		nuevoUsuario.devolverReceta("arroz con llopo").agregarCondimento(caldo)
		
		Assert.assertTrue((nuevoUsuario.devolverReceta("arroz con llopo").ingredientes.contains(zanahoria)))
		Assert.assertFalse((recetarioPublico.busquedaReceta("Arroz con Pollo")).ingredientes.contains(zanahoria))
		Assert.assertTrue((nuevoUsuario.devolverReceta("arroz con llopo").condimentos.contains(caldo)))
		Assert.assertFalse((recetarioPublico.busquedaReceta("Arroz con Pollo")).condimentos.contains(caldo))
	
		//Verifica si la receta no es apta para veganos, ni para hipertensos
		Assert.assertFalse((nuevoUsuario.devolverReceta("arroz con llopo")).inadecuadaParaCondiciones().exists[esDiabetes])
		Assert.assertTrue((nuevoUsuario.devolverReceta("arroz con llopo")).inadecuadaParaCondiciones().exists[esVegano])
		Assert.assertTrue((nuevoUsuario.devolverReceta("arroz con llopo")).inadecuadaParaCondiciones().exists[esHipertension])
	}
	
}