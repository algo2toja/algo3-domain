package ar.tp.dieta

import java.util.ArrayList
import java.util.GregorianCalendar
import java.util.List
import org.junit.Assert
import org.junit.Before
import org.junit.Test

class TestAll {
	
	//Objetos para Usuario
	Usuario nuevoUsuario
	//Carne chori
	//Fruta kiwi
	RutinaActiva taeBo
	List<Condicion> condiciones = new ArrayList<Condicion>
	List<String> preferencias = new ArrayList<String>
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
		taeBo = new RutinaActiva => [
			setTiempoDeEjercicio(90)
		]
		
		condiciones.add(new CondicionVegano)
		preferencias.add("carne")
		
		nuevoUsuario = new Usuario("Marco",60.5,1.95,taeBo,new GregorianCalendar(1985, 4, 13),condiciones,preferencias) =>[
			setPeso(105.3)
			setAltura(1.95)
			setFechaDeNacimiento(1985, 4, 13) // Nacio el 28 de junio de 1989
			setSexo("Masculino")
			setNombre("Marco")
			setRutina(taeBo)
			agregarCondicion(new CondicionVegano)
			agregarPreferencia(chori)
			agregarPreferencia(kiwi)
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