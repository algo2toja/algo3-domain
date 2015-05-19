package ar.tp.dieta

import org.junit.Before
import org.junit.Test
import org.junit.Assert
import java.util.List
import java.util.ArrayList

///////////////////////////////////////////////////FALTA TEST INGREDIENTE CARO////////////////////////////////

class TestEntregaDos {
	RecetarioPublico recetario = new RecetarioPublico
	
// ######## USUARIOS ###########	
	Usuario usuarioNormal = new Usuario
	Usuario usuarioVegano = new Usuario
	Usuario usuarioHipertenso = new Usuario
	Usuario usuarioDiabetico = new Usuario
	
// ######## GRUPO #############
	Grupo	grupoConHipertenso = new Grupo
	
// ######## RECETAS ###########
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
	Receta lomoMostaza = new Receta
	Receta gelatina = new Receta
	
// ########## INGREDIENTES ########
	Ingrediente cebolla = new Ingrediente
	Ingrediente carne = new Ingrediente
	Ingrediente sal = new Ingrediente
	Ingrediente arroz = new Ingrediente
	Ingrediente pollo = new Ingrediente
	Ingrediente pasta = new Ingrediente
	Ingrediente cereal = new Ingrediente
	Ingrediente azucar = new Ingrediente
	Ingrediente lomo = new Ingrediente
	
	Filtro filtroBase = new FiltroBase
	
	@Before
	def void init(){
		usuarioVegano.condicionesPreexistentes.add(new CondicionVegano)
		usuarioHipertenso.condicionesPreexistentes.add(new CondicionHipertension)
		usuarioDiabetico.condicionesPreexistentes.add(new CondicionDiabetes)
		grupoConHipertenso.agregarUsuario(usuarioHipertenso)
		usuarioHipertenso.misGrupos.add(grupoConHipertenso)
		
		usuarioVegano.agregarComidaQueMeDisgusta("arroz")
		
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
		azucar.setNombre("azucar")
		pasta.setNombre("pasta")
		cereal.setNombre("cereal")
		lomo.setNombre("lomo")
		
		azucar.setCantidad(300)
		
		arrozBlanco.setCalorias(499)
		ensalada.setCalorias(100)
		asado.setCalorias(501)
		arrozConPollo.setCalorias(600)
		
		ensalada.agregarIngrediente(sal)
		ensalada.agregarIngrediente(cebolla)
		asado.agregarIngrediente(carne)
		asado.agregarIngrediente(sal)
		arrozBlanco.agregarIngrediente(arroz)
		arrozConPollo.agregarIngrediente(pollo)
		arrozConPollo.agregarIngrediente(arroz)
		bondiola.agregarIngrediente(carne)
		bondiola.agregarIngrediente(sal)
		fideos.agregarIngrediente(sal)
		fideos.agregarIngrediente(pasta)
		cerealitos.agregarIngrediente(cereal)
		cerealitos.agregarIngrediente(azucar)
		lomoMostaza.agregarIngrediente(lomo)
		gelatina.agregarIngrediente(cebolla)
		
	}
	
	@Test
	def void sePuedeSugerirRecetaAUsuario(){
		Assert.assertTrue(usuarioVegano.tePuedoSugerirEstaReceta(ensalada))
	}
	
	@Test
	def void noSePuedeSugeriRecetaAUsuario(){
		Assert.assertFalse(usuarioVegano.tePuedoSugerirEstaReceta(asado)) // no se puede, contiene carne
		Assert.assertFalse(usuarioVegano.tePuedoSugerirEstaReceta(arrozBlanco)) //no se puede porque no le gusta
		Assert.assertFalse(usuarioHipertenso.tePuedoSugerirEstaReceta(asado)) //no se puede porque tiene sal
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
	def filtroBaseNoModifica(){
		var List<Receta> recetasFiltradas = new ArrayList<Receta>
		grupoConHipertenso.agregarUsuario(usuarioNormal)
		usuarioNormal.misGrupos.add(grupoConHipertenso)
		usuarioHipertenso.misRecetas.add(arrozBlanco)
		recetario.agregarReceta(asado)
		usuarioNormal.misRecetas.add(ensalada)
		recetasFiltradas = filtroBase.aplicarFiltro(usuarioNormal)
		
		Assert.assertTrue(recetasFiltradas.contains(ensalada))
		Assert.assertTrue(recetasFiltradas.contains(asado))
		Assert.assertTrue(recetasFiltradas.contains(arrozBlanco))
		
	}
	
	@Test
	def filtraPorExesoDeCalorias(){
		var List<Receta> recetasFiltradas = new ArrayList<Receta>
		var Filtro filtroCalorias = new FiltroExcesoDeCalorias(filtroBase)
		
		//usuario normal tiene sobrepeso
		usuarioNormal.misRecetas.add(arrozBlanco) //499 calorias
		usuarioNormal.misRecetas.add(ensalada) //100 calorias
		usuarioNormal.misRecetas.add(asado) //501 calorias
		usuarioNormal.misRecetas.add(arrozConPollo) // 600 calorias
		
		recetasFiltradas = filtroCalorias.aplicarFiltro(usuarioNormal)
		
		Assert.assertTrue(recetasFiltradas.contains(ensalada))
		Assert.assertFalse(recetasFiltradas.contains(asado))
		Assert.assertTrue(recetasFiltradas.contains(arrozBlanco))
		Assert.assertFalse(recetasFiltradas.contains(arrozConPollo))
		
	}
	
	@Test
	def filtroPorCondicionesUsuario(){
		var List<Receta> recetasFiltradas = new ArrayList<Receta>
		var Filtro filtroCondicion = new FiltroPorCondicion(filtroBase)	
		
		//Usuario con hipertension pertenece a este grupo
		grupoConHipertenso.agregarUsuario(usuarioNormal)
		usuarioNormal.misGrupos.add(grupoConHipertenso)

		usuarioNormal.misRecetas.add(arrozBlanco) 
		usuarioNormal.misRecetas.add(ensalada) //contiene sal
		usuarioNormal.misRecetas.add(asado) //contiene sal
		usuarioNormal.misRecetas.add(arrozConPollo)
		
		recetasFiltradas = filtroCondicion.aplicarFiltro(usuarioHipertenso)
		
		Assert.assertFalse(recetasFiltradas.contains(ensalada))
		Assert.assertFalse(recetasFiltradas.contains(asado))
		Assert.assertTrue(recetasFiltradas.contains(arrozBlanco))
		Assert.assertTrue(recetasFiltradas.contains(arrozConPollo))
		
		
	}
	
	@Test //el mismo test de antes, pero aplicado al grupo
	def filtroPorCondicionGrupo(){
		var List<Receta> recetasFiltradas = new ArrayList<Receta>
		var Filtro filtroCondicion = new FiltroPorCondicion(filtroBase)	
		
		//Usuario con hipertension pertenece a este grupo
		grupoConHipertenso.agregarUsuario(usuarioNormal)
		usuarioNormal.misGrupos.add(grupoConHipertenso)

		usuarioNormal.misRecetas.add(arrozBlanco) 
		usuarioNormal.misRecetas.add(ensalada) //contiene sal
		usuarioNormal.misRecetas.add(asado) //contiene sal
		usuarioNormal.misRecetas.add(arrozConPollo)
		
		recetasFiltradas = filtroCondicion.aplicarFiltroGrupo(grupoConHipertenso)
		
		Assert.assertFalse(recetasFiltradas.contains(ensalada))
		Assert.assertFalse(recetasFiltradas.contains(asado))
		Assert.assertTrue(recetasFiltradas.contains(arrozBlanco))
		Assert.assertTrue(recetasFiltradas.contains(arrozConPollo))
		
	}
	
	@Test
	def void filtroPorGustos(){
		var List<Receta> recetasFiltradas = new ArrayList<Receta>
		var Filtro filtroGustos = new FiltroPorGustos(filtroBase)
		
		usuarioNormal.comidasQueNoMeGustan.add("arroz") // le disgusta el arroz
		
		usuarioNormal.misRecetas.add(arrozBlanco)
		usuarioNormal.misRecetas.add(arrozConPollo)
		usuarioNormal.misRecetas.add(ensalada)
		usuarioNormal.misRecetas.add(asado)
		
		recetasFiltradas = filtroGustos.aplicarFiltro(usuarioNormal)
		
		Assert.assertTrue(recetasFiltradas.contains(ensalada))
		Assert.assertTrue(recetasFiltradas.contains(asado))
		Assert.assertFalse(recetasFiltradas.contains(arrozBlanco))
		Assert.assertFalse(recetasFiltradas.contains(arrozConPollo))
		
	}
	
	@Test
	def filtroPorIngredienteCaro(){
		var List<Receta> recetasFiltradas = new ArrayList<Receta>
		var Filtro filtroIngrediente = new FiltroPorIngredienteCaro(filtroBase)
		
		usuarioNormal.misRecetas.add(lomoMostaza) // contiene ingrediente caro (lomo)
		usuarioNormal.misRecetas.add(arrozBlanco)
		usuarioNormal.misRecetas.add(arrozConPollo)
		usuarioNormal.misRecetas.add(ensalada)
		usuarioNormal.misRecetas.add(asado)
		
		recetasFiltradas = filtroIngrediente.aplicarFiltro(usuarioNormal)
		
		Assert.assertTrue(recetasFiltradas.contains(ensalada))
		Assert.assertTrue(recetasFiltradas.contains(asado))
		Assert.assertTrue(recetasFiltradas.contains(arrozBlanco))
		Assert.assertTrue(recetasFiltradas.contains(arrozConPollo))
		Assert.assertFalse(recetasFiltradas.contains(lomoMostaza)) // no lo contiene
		
	}
}