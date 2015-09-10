package ar.tp.dieta

import java.util.ArrayList
import java.util.List
import org.junit.Before
import org.junit.Test

class TestAccion2 {
	
		ContadorConsultas observer = new ContadorConsultas
		List<Receta> recetas = new ArrayList<Receta>
		List<Usuario> usuarios = new ArrayList<Usuario>
		RecetarioPublico recetario = new RecetarioPublico
		String mensaje
		Busqueda busqueda1 = new Busqueda => [
				agregarFiltro(new FiltroPorIngredienteCaro)
		]
		
		Busqueda busqueda2 = new Busqueda => [
			agregarFiltro(new PosteriorBusquedaOrdenadoCalorias)
		]
		
		Busqueda busqueda3 = new Busqueda => [
			agregarFiltro(new FiltroPorGustos)
		]
		
		RutinaActiva basket = new RutinaActiva => [
				setTiempoDeEjercicio(240)
			]
			
		Usuario usuarioVegano
		Receta arrozConPollo
		Receta fideosConManteca
		Receta lomoMostaza
		Receta gelatinaFrambuesa
		Receta ensalada
		Receta arrozBlanco
	
	@Before
	def void init (){
			
		usuarioVegano = new UsuarioBuilder("Miguel","miguel").peso(70.5).altura(1.73).fechaNacimiento(1989, 6, 28).sexo("M").rutina(basket).condicion(new CondicionVegano).preferencia("fruta").email("soyvegano@edrans.com").build()
		
		arrozConPollo = new RecetaBuilder("Arroz con Pollo").calorias(500).autor("Carlos Nahir").dificultad("Mediana").procesoPreparacion("Hervir el arroz con azafran y agregar el pollo previamente salteado").temporada("Invierno").agregarIngrediente(new IngredienteBuilder("arroz").cantidad(500).build()).agregarIngrediente(new IngredienteBuilder("pollo").cantidad(1000).build()).agregarCondimento(new CondimentoBuilder("azafran").cantidad(2).build()).build()
		fideosConManteca = new RecetaBuilder("Fideos con manteca").calorias(600).autor("Narda Lepes").dificultad("Facil").procesoPreparacion("Hervir los fideos. Colar.").temporada("Invierno").agregarIngrediente(new IngredienteBuilder("pasta").cantidad(500).build()).agregarCondimento(new CondimentoBuilder("sal").cantidad(2).build()).agregarIngrediente(new IngredienteBuilder("manteca").cantidad(10).build()).build()
		lomoMostaza = new RecetaBuilder("Lomo a la Mostaza").calorias(1200).autor("Mirtha Legrand").dificultad("Dificil").procesoPreparacion("Poner el lomo con la mostaza en el horno.").temporada("Verano").agregarIngrediente(new IngredienteBuilder("lomo").cantidad(1000).build()).agregarCondimento(new CondimentoBuilder("sal").cantidad(2).build()).agregarCondimento(new CondimentoBuilder("mostaza").cantidad(30).build()).build()
		gelatinaFrambuesa = new RecetaBuilder("Gelatina de Frambuesa").calorias(120).autor("Dolly").dificultad("Facil").procesoPreparacion("Mezclar gelatina azucar y agua").temporada("Verano").agregarIngrediente(new IngredienteBuilder("gelatina").cantidad(250).build()).agregarCondimento(new CondimentoBuilder("azucar").cantidad(500).build()).build()
		ensalada = new RecetaBuilder("Ensalada").calorias(10).autor("Antonio Gasalla").dificultad("Facil").procesoPreparacion("Cortar la verdura y mezclar. No olvidar de lavar").temporada("Verano").agregarIngrediente(new IngredienteBuilder("cebolla").cantidad(150).build()).agregarIngrediente(new IngredienteBuilder("lechuga").cantidad(300).build()).agregarIngrediente(new IngredienteBuilder("tomate").cantidad(150).build()).agregarCondimento(new CondimentoBuilder("sal").cantidad(2).build()).build()
		arrozBlanco = new RecetaBuilder("Arroz Blanco").calorias(10).autor("Antonio Gasalla").dificultad("Facil").procesoPreparacion("Hervir el arroz. Comer.").temporada("Invierno").agregarIngrediente(new IngredienteBuilder("arroz").cantidad(500).build()).build()
				
		recetario.agregarReceta(arrozConPollo)
		recetario.agregarReceta(fideosConManteca)
		recetario.agregarReceta(lomoMostaza)
		recetario.agregarReceta(gelatinaFrambuesa)
		recetario.agregarReceta(ensalada)
		recetario.agregarReceta(arrozBlanco)
		usuarioVegano.recetario = recetario
		
		usuarios.add(usuarioVegano)
		usuarioVegano.observerConsulta = observer
		
		
	}
	
	@Test
	def void testeo(){
		
				usuarioVegano.agregarBusqueda(busqueda1)
				usuarioVegano.busquedaFiltrada()
				usuarioVegano.getObserverConsulta.getRecetasFinales
				//Assert.assertTrue(accion.recetasAux.size.equals(5))
				//Assert.assertTrue(usuarioVegano.busquedaFiltrada().size.equals(5))
				usuarioVegano.removerBusqueda(busqueda1)
				usuarioVegano.agregarBusqueda(busqueda2)
				usuarioVegano.busquedaFiltrada()
				usuarioVegano.getObserverConsulta.getRecetasFinales
				//println(usuarioVegano.busquedaFiltrada().size)
				//Assert.assertTrue(usuarioVegano.busquedaFiltrada().size.equals(6))
				//accion.ordenar
//				Assert.assertTrue(accion.getRecetasFinales.contains(lomoMostaza))
//				Assert.assertTrue(accion.recetasAux.contains(lomoMostaza))
//				Assert.assertTrue(accion.recetasAux.contains(arrozBlanco))
//				usuarioVegano.removerBusqueda(busqueda2)
//				usuarioVegano.comidasQueNoMeGustan.add("arroz")
//				usuarioVegano.agregarBusqueda(busqueda3)
//				usuarios.get(0).busquedaFiltrada()
//				//println(usuarioVegano.busquedaFiltrada().size)
//				Assert.assertTrue(usuarioVegano.busquedaFiltrada().size.equals(4))
//				Assert.assertTrue(accion.getRecetasFinales.contains(lomoMostaza))
//				Assert.assertTrue(accion.recetasAux.contains(lomoMostaza))
//				Assert.assertTrue(accion.recetasAux.contains(arrozBlanco))
//				println(accion.recetasMasConsultadas.get(fideosConManteca))
//				println(accion.recetasMasConsultadas.get(ensalada))
//				println(accion.recetasMasConsultadas.get(gelatinaFrambuesa))
//				println(accion.recetasMasConsultadas.get(arrozBlanco))
//				println(accion.recetasMasConsultadas.get(lomoMostaza))
//				println(accion.recetasMasConsultadas.get(arrozConPollo))
//				println(accion.recetasFinales.get(0).nombreDeLaReceta)
//				println(accion.recetasFinales.get(1).nombreDeLaReceta)
//				println(accion.recetasFinales.get(2).nombreDeLaReceta)
//				println(accion.recetasFinales.get(3).nombreDeLaReceta)
//				println(accion.recetasFinales.get(4).nombreDeLaReceta)
//				println(accion.recetasFinales.get(5).nombreDeLaReceta)
				
				
	}
}