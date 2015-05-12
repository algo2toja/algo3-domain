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
	Receta  arrozConPollo = new Receta
	
	Ingrediente cebolla = new Ingrediente
	Ingrediente carne = new Ingrediente
	Ingrediente sal = new Ingrediente
	Ingrediente arroz = new Ingrediente
	Ingrediente pollo = new Ingrediente
	
	
	
	
	@Before
	def void init(){
		usuarioVegano.condicionesPreexistentes.add(new CondicionVegano)
		usuarioVegano.agregarComidaQueMeDisgusta("arroz")
		usuarioHipertenso.condicionesPreexistentes.add(new CondicionHipertension)
		
		grupoConHipertenso.agregarUsuario(usuarioHipertenso)
		
		usuarioNormal.setAltura(1.3)
		usuarioNormal.setPeso(150.0)
		usuarioNormal.setRecetario(recetario)
		usuarioDiabetico.setRecetario(recetario)
		usuarioHipertenso.setRecetario(recetario)
		
		sal.setNombre("sal")
		cebolla.setNombre("cebolla")
		carne.setNombre("carne")
		arroz.setNombre("arroz")
		pollo.setNombre("pollo")
		
		ensalada.agregarIngrediente(sal)
		ensalada.agregarIngrediente(cebolla)
		
		asado.agregarIngrediente(carne)
		asado.agregarIngrediente(sal)
		
		arrozBlanco.agregarIngrediente(arroz)
		
		arrozConPollo.agregarIngrediente(pollo)
		arrozConPollo.agregarIngrediente(arroz)
		
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
	def combinacionDeFiltrosYProcesoPostBusqueda(){
		var List<Receta> recetasFiltradas = new ArrayList<Receta>
		var List<Receta> recetasProcesadas = new ArrayList<Receta>
		usuarioNormal.misGrupos.add(grupoConHipertenso)
		grupoConHipertenso.agregarUsuario(usuarioNormal)
		
		arrozBlanco.setCalorias(499)
		ensalada.setCalorias(100)
		asado.setCalorias(501)
		arrozConPollo.setCalorias(200)
		
		recetario.agregarReceta(arrozBlanco)
		recetario.agregarReceta(arrozConPollo)
		
		usuarioHipertenso.misRecetas.add(ensalada)
		
		usuarioNormal.misRecetas.add(asado)
		usuarioNormal.agregarComidaQueMeDisgusta("pollo") 						// le disgusta el pollo
		var Filtro filtrazo = (new FiltroExcesoDeCalorias(new FiltroBase))
		usuarioNormal.setFiltro(filtrazo)
		
				
		recetasFiltradas = usuarioNormal.busquedaFiltrada()
		Assert.assertFalse(recetasFiltradas.exists[equals(asado)]) 				//descarta el asado por las caloias
		Assert.assertTrue(recetasFiltradas.exists[equals(arrozConPollo)])		// descarta el arroz con pollo por los gustos
		
		Assert.assertTrue(recetasFiltradas.exists[equals(ensalada)])
		Assert.assertTrue(recetasFiltradas.exists[equals(arrozBlanco)])
		
		Assert.assertTrue(recetasFiltradas.get(0).equals(arrozBlanco))			// el primero es el arroz
		}
		
		/*usuarioNormal.setProceso(new PosteriorBusquedaOrdenadoCalorias)
		recetasProcesadas = usuarioNormal.aplicarProcesamientoBusqueda(recetasFiltradas)
		Assert.assertTrue(recetasProcesadas.get(0).equals(ensalada)) 			//ahora despues de ordenar, el primero es la ensalada
		Assert.assertTrue(recetasProcesadas.get(1).equals(arrozBlanco))
		}*/
}