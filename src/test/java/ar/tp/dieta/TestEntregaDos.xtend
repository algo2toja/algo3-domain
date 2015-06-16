package ar.tp.dieta

import org.junit.Test
import org.junit.Assert
import java.util.List
import java.util.ArrayList

///////////////////////////////////////////////////FALTA TEST INGREDIENTE CARO////////////////////////////////

class TestEntregaDos extends TestRepositorio{
	/*
	var Busqueda busqueda = new Busqueda
	
	RecetarioPublico recetario = new RecetarioPublico
	Usuario usuarioNormal = new Usuario
	Usuario usuarioVegano = new Usuario
	Usuario usuarioHipertenso = new Usuario
	Usuario usuarioDiabetico = new Usuario
	Grupo	grupoConHipertenso = new Grupo
	Receta	recetaPropia = new Receta
	Receta	recetaPorGrupo = new Receta
	Receta 	recetaPublica = new Receta
	Receta	recetaPrivada = new Receta
	Receta  ensalada = new Receta
	Receta	asado = new Receta
	Receta  arrozBlanco = new Receta
	Receta  arrozConPollo = new Receta
	Receta bondiola = new Receta
	Receta fideos = new Receta
	Receta cerealitos = new Receta
	Receta bofe = new Receta
	Receta gelatina = new Receta
	Receta lomoMostaza = new Receta


	
	Ingrediente lomo = new Ingrediente
	Ingrediente cebolla = new Ingrediente
	Ingrediente carne = new Ingrediente
	Ingrediente sal = new Ingrediente
	Ingrediente arroz = new Ingrediente
	Ingrediente pollo = new Ingrediente
	Ingrediente pasta = new Ingrediente
	Ingrediente cereal = new Ingrediente
	Ingrediente azucar = new Ingrediente
	
	
	@Before
	override void init(){
		
		usuarioVegano.condicionesPreexistentes.add(new CondicionVegano)
		usuarioVegano.agregarComidaQueMeDisgusta("arroz")
		usuarioHipertenso.condicionesPreexistentes.add(new CondicionHipertension)
		usuarioDiabetico.condicionesPreexistentes.add(new CondicionDiabetes)
		
		grupoConHipertenso.agregarUsuario(usuarioHipertenso)
		
		usuarioNormal.setAltura(1.3)
		usuarioNormal.setPeso(150.0)
		usuarioNormal.setRecetario(recetario)
		
		usuarioVegano.setRecetario(recetario)
		
		usuarioHipertenso.setRecetario(recetario)
		
		usuarioDiabetico.setRecetario(recetario)
		
		grupoConHipertenso.setRecetario(recetario)
		
		sal.setNombre("sal")
		cebolla.setNombre("cebolla")
		carne.setNombre("carne")
		arroz.setNombre("arroz")
		pollo.setNombre("pollo")
		azucar.setCantidad(300)
		azucar.setNombre("azucar")
		pasta.setNombre("pasta")
		cereal.setNombre("cereal")
		lomo.setNombre("lomo")
		
		arrozBlanco.setCalorias(499)
		ensalada.setCalorias(100)
		asado.setCalorias(501)
		arrozConPollo.setCalorias(200)
		
		ensalada.agregarIngrediente(sal)
		ensalada.agregarIngrediente(cebolla)
		
		asado.agregarIngrediente(carne)
		asado.agregarIngrediente(sal)
		lomoMostaza.agregarIngrediente(lomo)
		arrozBlanco.agregarIngrediente(arroz)
		
		arrozConPollo.agregarIngrediente(pollo)
		arrozConPollo.agregarIngrediente(arroz)
		
		bondiola.agregarIngrediente(carne)
		bondiola.agregarIngrediente(sal)
		
		fideos.agregarIngrediente(sal)
		fideos.agregarIngrediente(pasta)
		
		cerealitos.agregarIngrediente(cereal)
		cerealitos.agregarIngrediente(azucar)
		
		bofe.agregarIngrediente(carne)
		
		gelatina.agregarIngrediente(cebolla)
		
	}
	 */
	@Test
	def void sePuedeSugerirRecetaAUsuario(){
		Assert.assertTrue(usuarioVegano.tePuedoSugerirEstaReceta(ensalada))
	}
	
	@Test
	def void noSePuedeSugerirRecetaAUsuario(){
		Assert.assertFalse(usuarioVegano.tePuedoSugerirEstaReceta(lomoMostaza))
		Assert.assertFalse(usuarioVegano.tePuedoSugerirEstaReceta(arrozConPollo))
	}
	
	@Test
	def void sePuedeSugerirRecetaAUnGrupo(){
		grupoHipertenso.preferencias.add("arroz")
		Assert.assertTrue(grupoHipertenso.tePuedoSugerirEstaReceta(arrozConPollo))	
	}	
	
	@Test
	def void noSePuedeSugerirRecetaAUnGrupo(){
		Assert.assertFalse(grupoHipertenso.tePuedoSugerirEstaReceta(arrozConPollo)) 
		grupoHipertenso.preferencias.add("cebolla")
		grupoHipertenso.agregarUsuario(usuarioHipertenso)
		Assert.assertFalse(grupoHipertenso.tePuedoSugerirEstaReceta(ensalada)) //La sal no se recomienda para hipertensos
	}

	@Test
	def void recetasQueUnUsuarioTieneAcceso(){
		usuarioDiabetico.recetario = recetarioPublico
		var List<Receta> recetasQuePuedeVer = new ArrayList<Receta>

		recetarioPublico.agregarReceta(gelatinaFrambuesa)
		usuarioSinCondicion.misRecetas.add(arrozConPollo)
		
		grupoHipertenso.agregarUsuario(usuarioDiabetico)
		
		usuarioDiabetico.misRecetas.add(ensalada)
		usuarioDiabetico.misGrupos.add(grupoHipertenso)
		usuarioHipertenso.misRecetas.add(lomoMostaza)

		recetasQuePuedeVer = usuarioDiabetico.recetasQuePuedoVer()
		
		Assert.assertTrue(recetasQuePuedeVer.exists[ receta | receta.equals(gelatinaFrambuesa) ])
		Assert.assertTrue(recetasQuePuedeVer.exists[ receta | receta.equals(lomoMostaza) ])
		Assert.assertTrue(recetasQuePuedeVer.exists[ receta | receta.equals(ensalada) ])
		Assert.assertTrue(recetasQuePuedeVer.exists[ receta | receta.equals(arrozConPollo) ])
	}
	
	@Test
	def filtroPorIngredienteCaro(){
		
		usuarioSinCondicion.recetario = recetarioPublico
		var List<Receta> recetasFiltradas = new ArrayList<Receta>
		busqueda.agregarFiltro(new FiltroPorIngredienteCaro)
		
		usuarioSinCondicion.getMisBusquedas.add(busqueda)
		
		usuarioSinCondicion.misRecetas.add(lomoMostaza)
		usuarioSinCondicion.misRecetas.add(arrozBlanco)
		usuarioSinCondicion.misRecetas.add(arrozConPollo)
		usuarioSinCondicion.misRecetas.add(ensalada)
		
		recetasFiltradas = usuarioSinCondicion.busquedaFiltrada
		
		Assert.assertTrue(recetasFiltradas.contains(ensalada))
		Assert.assertTrue(recetasFiltradas.contains(arrozBlanco))
		Assert.assertTrue(recetasFiltradas.contains(arrozConPollo))
		Assert.assertFalse(recetasFiltradas.contains(lomoMostaza))
		
	}
	
	@Test
	def combinacionDeFiltrosYProcesoPostBusqueda(){
		
		usuarioSinCondicion.recetario = recetarioPublico
		var List<Receta> recetasFiltradas = new ArrayList<Receta>
		var Busqueda busqueda = new Busqueda
		busqueda.agregarFiltro(new FiltroExcesoDeCalorias)
		busqueda.agregarFiltro(new FiltroPorGustos)
		busqueda.agregarFiltro(new PosteriorBusquedaOrdenadoCalorias)
		
		usuarioSinCondicion.misGrupos.add(grupoHipertenso)
		grupoHipertenso.agregarUsuario(usuarioSinCondicion)
		recetarioPublico.agregarReceta(arrozBlanco)
		usuarioHipertenso.misRecetas.add(ensalada)
		usuarioSinCondicion.misRecetas.add(arrozConPollo)
		usuarioSinCondicion.agregarComidaQueMeDisgusta("pollo") //Le disgusta el pollo
		usuarioSinCondicion.getMisBusquedas.add(busqueda)
		
		recetasFiltradas = usuarioSinCondicion.busquedaFiltrada()

		Assert.assertFalse(recetasFiltradas.exists[ equals(arrozConPollo) ]) //Descarta el arroz con pollo por los gustos
		Assert.assertTrue(recetasFiltradas.exists[ equals(arrozBlanco) ])
		Assert.assertFalse(recetasFiltradas.exists[ equals(ensalada) ]) //Tiene que fallar porque no existe ensalada
		
		Assert.assertFalse(recetasFiltradas.get(0).equals(ensalada))	//Primero en la posicion es el arrozBlanco
		
		}
		
	@Test
	def filtradoDePrimerasRecetas(){
		
		grupoHipertenso.recetario = recetarioPublico
		var List<Receta> recetasAptas = new ArrayList<Receta>
		busqueda.agregarFiltro(new FiltroPorCondicion)
		usuarioSinCondicion.misGrupos.add(grupoHipertenso)
		grupoHipertenso.agregarUsuario(usuarioSinCondicion)
		usuarioDiabetico.misGrupos.add(grupoHipertenso)
		grupoHipertenso.agregarUsuario(usuarioDiabetico)
		recetarioPublico.agregarReceta(arrozBlanco)
		recetarioPublico.agregarReceta(arrozConPollo)
		usuarioSinCondicion.misRecetas.add(gelatinaFrambuesa)
		usuarioDiabetico.misRecetas.add(fideosConManteca)
		
		recetasAptas = grupoHipertenso.busquedaFiltrada()
		Assert.assertTrue(recetasAptas.contains(gelatinaFrambuesa))
		Assert.assertTrue(recetasAptas.contains(arrozConPollo))
		Assert.assertTrue(recetasAptas.contains(arrozBlanco))
		Assert.assertTrue(gelatinaFrambuesa.esInadecuadaParaGrupo(grupoHipertenso)) //Inadecuada porque tiene un usuarioDiabetico.
		Assert.assertFalse(arrozBlanco.esInadecuadaParaGrupo(grupoHipertenso))
		Assert.assertFalse(arrozConPollo.esInadecuadaParaGrupo(grupoHipertenso))
		Assert.assertFalse(fideosConManteca.esInadecuadaParaGrupo(grupoHipertenso))
	
	}

}