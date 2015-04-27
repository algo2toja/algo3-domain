package ar.tp.dieta

import org.junit.Assert
import org.junit.Before
import org.junit.Test

class TestAll {
	
	//Objetos para Usuario
	Usuario nuevoUsuario
	Carne chori
	RutinaActiva taeBo

	//Objetos para Receta
	Receta arrozConPollo
	RecetarioPublico recetarioPublico
	Ingrediente arroz
	Ingrediente pollo
	Condimento sal
	
	
	
	@Before
	def void init(){
		taeBo = new RutinaActiva
		taeBo.setTiempoDeEjercicio(90)
		
		chori = new Carne
		
		nuevoUsuario = new Usuario =>[
			setPeso(105.3)
			setAltura(1.95)
			setFechaDeNacimiento(1985, 4, 13) // Nacio el 28 de junio de 1989
			setSexo("Masculino")
			setNombre("Marco")
			setRutina(taeBo)
			agregarCondicion(new CondicionVegano)
			agregarPreferencia(chori)
		]
		
		pollo = new IngredienteCarne
		pollo.setCantidad(250)
		
		arroz = new Ingrediente
		arroz.setCantidad(250)
		
		sal = new CondimentoSalado
		sal.setCantidad(0)
				
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
	
	@Test(expected=typeof(BusinessException)) //Vegano y le gusta el chori :P
	def void validarUnUsuario() {
		Assert.assertTrue(nuevoUsuario.validacionUsuario())	
	}
	
	@Test
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
	}
	
}