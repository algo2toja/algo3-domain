package ar.tp.dieta

import org.junit.Before
import org.junit.Test
import org.junit.Assert
import java.util.List
import java.util.ArrayList

class TestEntregaDos {
	
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
	
	Ingrediente cebolla = new Ingrediente
	Ingrediente carne = new Ingrediente
	Ingrediente sal = new Ingrediente
	Ingrediente arroz = new Ingrediente
	
	
	
	
	
	@Before
	def void init(){
		usuarioVegano.condicionesPreexistentes.add(new CondicionVegano)
		usuarioVegano.agregarComidaQueMeDisgusta("arroz")
		usuarioHipertenso.condicionesPreexistentes.add(new CondicionHipertension)
		
		grupoConHipertenso.agregarUsuario(usuarioHipertenso)
		
		usuarioNormal.setAltura(1.3)
		usuarioNormal.setPeso(150.0)
		
		sal.setNombre("sal")
		cebolla.setNombre("cebolla")
		carne.setNombre("carne")
		arroz.setNombre("arroz")
		
		ensalada.agregarIngrediente(sal)
		ensalada.agregarIngrediente(cebolla)
		
		asado.agregarIngrediente(carne)
		asado.agregarIngrediente(sal)
		
		arrozBlanco.agregarIngrediente(arroz)
		
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

		recetasQuePuedeVer = usuarioDiabetico.recetasQuePuedoVer(recetario)
		
		Assert.assertTrue(recetasQuePuedeVer.exists[rec| rec.equals(recetaPublica)])
		Assert.assertTrue(recetasQuePuedeVer.exists[rec| rec.equals(recetaPorGrupo)])
		Assert.assertTrue(recetasQuePuedeVer.exists[rec| rec.equals(recetaPropia)])
		Assert.assertFalse(recetasQuePuedeVer.exists[rec| rec.equals(recetaPrivada)])
	}
	
	@Test
	def recetasSeFiltranPorCalorias(){
		var List<Receta> recetasFiltradas = new ArrayList<Receta>
		usuarioNormal.misGrupos.add(grupoConHipertenso)
		grupoConHipertenso.agregarUsuario(usuarioNormal)
		arrozBlanco.setCalorias(500)
		ensalada.setCalorias(499)
		asado.setCalorias(501)
		recetario.agregarReceta(arrozBlanco)
		usuarioHipertenso.misRecetas.add(ensalada)
		usuarioNormal.misRecetas.add(asado)
		usuarioNormal.misFiltros.add(new FiltroExcesoDeCalorias)
		
		recetasFiltradas = usuarioNormal.busquedaFiltrada(recetario)
		
		Assert.assertTrue(recetasFiltradas.exists[equals(arrozBlanco)])
		Assert.assertTrue(recetasFiltradas.exists[equals(ensalada)])
		Assert.assertFalse(recetasFiltradas.exists[equals(asado)])
		
		}
/*	
	@Test
	def void usuarioAgregaRecetaAFavoritos(){
		
	}
	* 
	*/
}