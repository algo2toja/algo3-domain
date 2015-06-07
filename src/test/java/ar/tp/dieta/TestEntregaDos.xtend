package ar.tp.dieta

import org.junit.Before
import org.junit.Test
import org.junit.Assert
import java.util.List
import java.util.ArrayList

///////////////////////////////////////////////////FALTA TEST INGREDIENTE CARO////////////////////////////////

class TestEntregaDos {
	
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
	def void init(){
		
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
	
	@Test
	def void sePuedeSugerirRecetaAUsuario(){
		Assert.assertTrue(usuarioVegano.tePuedoSugerirEstaReceta(ensalada))
	}
	
	@Test
	def void noSePuedeSugeriRecetaAUsuario(){
		Assert.assertFalse(usuarioVegano.tePuedoSugerirEstaReceta(asado))
		Assert.assertFalse(usuarioVegano.tePuedoSugerirEstaReceta(arrozBlanco))
		Assert.assertFalse(usuarioHipertenso.tePuedoSugerirEstaReceta(asado))
	}
	
	@Test
	def void sePuedeSugerirRecetaAUnGrupo(){
		grupoConHipertenso.preferencias.add("arroz")
		Assert.assertTrue(grupoConHipertenso.tePuedoSugerirEstaReceta(arrozBlanco))// el arroz, ingrediente de arrozBlanco,
	}																			   // es preferencia del grupo
	
	@Test
	def void noSePuedeSugerirRecetaAUnGrupo(){
		Assert.assertFalse(grupoConHipertenso.tePuedoSugerirEstaReceta(arrozBlanco)) //ningun ingrediente del arrozBlanco es
																					//preferencia del grupo
		grupoConHipertenso.preferencias.add("cebolla")
		Assert.assertFalse(grupoConHipertenso.tePuedoSugerirEstaReceta(ensalada))// La sal no se recomienda para hipertenso
	}

	@Test
	def void recetasQueUnUsuarioTieneAcceso(){
		var List<Receta> recetasQuePuedeVer = new ArrayList<Receta>
		recetario.agregarReceta(recetaPublica)
		usuarioNormal.misRecetas.add(recetaPrivada)
		
		grupoConHipertenso.agregarUsuario(usuarioDiabetico)
		
		usuarioDiabetico.misRecetas.add(recetaPropia)
		usuarioDiabetico.misGrupos.add(grupoConHipertenso)
		usuarioHipertenso.misRecetas.add(recetaPorGrupo)

		recetasQuePuedeVer = usuarioDiabetico.recetasQuePuedoVer()
		
		Assert.assertTrue(recetasQuePuedeVer.exists[rec| rec.equals(recetaPublica)])
		Assert.assertTrue(recetasQuePuedeVer.exists[rec| rec.equals(recetaPorGrupo)])
		Assert.assertTrue(recetasQuePuedeVer.exists[rec| rec.equals(recetaPropia)])
		Assert.assertFalse(recetasQuePuedeVer.exists[rec| rec.equals(recetaPrivada)])
	}
	
	@Test
	def filtroPorIngredienteCaro(){
		var List<Receta> recetasFiltradas = new ArrayList<Receta>
		busqueda.agregarFiltro(new FiltroPorIngredienteCaro)
		
		usuarioNormal.getMisBusquedas.add(busqueda)
		
		usuarioNormal.misRecetas.add(lomoMostaza) // contiene ingrediente caro (lomo)
		usuarioNormal.misRecetas.add(arrozBlanco)
		usuarioNormal.misRecetas.add(arrozConPollo)
		usuarioNormal.misRecetas.add(ensalada)
		usuarioNormal.misRecetas.add(asado)
		
		recetasFiltradas = usuarioNormal.busquedaFiltrada
		
		Assert.assertTrue(recetasFiltradas.contains(ensalada))
		Assert.assertTrue(recetasFiltradas.contains(asado))
		Assert.assertTrue(recetasFiltradas.contains(arrozBlanco))
		Assert.assertTrue(recetasFiltradas.contains(arrozConPollo))
		Assert.assertFalse(recetasFiltradas.contains(lomoMostaza)) // no lo contiene
		
	}
	@Test
	def combinacionDeFiltrosYProcesoPostBusqueda(){
		var List<Receta> recetasFiltradas = new ArrayList<Receta>
		var Busqueda busqueda = new Busqueda
		busqueda.agregarFiltro(new FiltroExcesoDeCalorias)
		busqueda.agregarFiltro(new FiltroPorGustos)
		busqueda.agregarFiltro(new PosteriorBusquedaOrdenadoCalorias)
		usuarioNormal.misGrupos.add(grupoConHipertenso)
		grupoConHipertenso.agregarUsuario(usuarioNormal)
		
		recetario.agregarReceta(arrozBlanco)
		recetario.agregarReceta(arrozConPollo)
		
		usuarioHipertenso.misRecetas.add(ensalada)
		
		usuarioNormal.misRecetas.add(asado)
		usuarioNormal.agregarComidaQueMeDisgusta("pollo") 						// le disgusta el pollo
		usuarioNormal.getMisBusquedas.add(busqueda)
		
		recetasFiltradas = usuarioNormal.busquedaFiltrada()
		Assert.assertFalse(recetasFiltradas.exists[equals(asado)]) 				//descarta el asado por las caloias
		Assert.assertFalse(recetasFiltradas.exists[equals(arrozConPollo)])		// descarta el arroz con pollo por los gustos
		
		Assert.assertTrue(recetasFiltradas.exists[equals(ensalada)])
		Assert.assertTrue(recetasFiltradas.exists[equals(arrozBlanco)])
		
		Assert.assertTrue(recetasFiltradas.get(0).equals(ensalada))			// el primero es el arroz
		
		}
		
	@Test
	def filtradoDePrimerasRecetas(){
		var List<Receta> recetasAptas = new ArrayList<Receta>
		//var List<Receta> recetasProcesadas = new ArrayList<Receta>
		busqueda.agregarFiltro(new FiltroPorCondicion)
		usuarioNormal.misGrupos.add(grupoConHipertenso)
		grupoConHipertenso.agregarUsuario(usuarioNormal)
		usuarioDiabetico.misGrupos.add(grupoConHipertenso)
		grupoConHipertenso.agregarUsuario(usuarioDiabetico)
		//grupoConHipertenso.setQuieroFiltrar(true)
		
		recetario.agregarReceta(arrozBlanco)
		recetario.agregarReceta(arrozConPollo)
		recetario.agregarReceta(bondiola)
		
		usuarioNormal.misRecetas.add(asado)
		usuarioNormal.misRecetas.add(gelatina)
		
		usuarioDiabetico.misRecetas.add(bofe)
		usuarioDiabetico.misRecetas.add(cerealitos)
		usuarioDiabetico.misRecetas.add(fideos)
		
		recetasAptas = grupoConHipertenso.busquedaFiltrada()
		//Assert.assertTrue(recetasAptas.size.equals(4))
		Assert.assertTrue(recetasAptas.contains(bofe))
		//Assert.assertFalse(recetasAptas.contains(cerealitos))
		//Assert.assertFalse(recetasAptas.contains(fideos))
		//Assert.assertFalse(recetasAptas.contains(asado))
		Assert.assertTrue(recetasAptas.contains(gelatina))
		Assert.assertTrue(recetasAptas.contains(arrozConPollo))
		Assert.assertTrue(recetasAptas.contains(arrozBlanco))
		Assert.assertFalse(bofe.esInadecuadaParaGrupo(grupoConHipertenso))
		Assert.assertFalse(gelatina.esInadecuadaParaGrupo(grupoConHipertenso))
		Assert.assertFalse(arrozBlanco.esInadecuadaParaGrupo(grupoConHipertenso))
		Assert.assertFalse(arrozConPollo.esInadecuadaParaGrupo(grupoConHipertenso))
		Assert.assertTrue(cerealitos.esInadecuadaParaGrupo(grupoConHipertenso))
		Assert.assertTrue(fideos.esInadecuadaParaGrupo(grupoConHipertenso))
		Assert.assertTrue(asado.esInadecuadaParaGrupo(grupoConHipertenso))
		Assert.assertTrue(bondiola.esInadecuadaParaGrupo(grupoConHipertenso))

	}

}