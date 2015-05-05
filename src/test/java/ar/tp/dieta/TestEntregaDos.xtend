package ar.tp.dieta

import org.junit.Before
import org.junit.Test
import org.junit.Assert

class TestEntregaDos {
	
	Usuario usuarioNormal = new Usuario
	Usuario usuarioVegano = new Usuario
	Usuario usuarioHipertenso = new Usuario
	Usuario usuarioDiabetico = new Usuario
	Grupo	grupoConVegano = new Grupo
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
		sal.setNombre("sal")
		cebolla.setNombre("cebolla")
		carne.setNombre("Carne")
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
		Assert.assertFalse(usuarioHipertenso.tePuedoSugerirEstaReceta(asado))
	}
	
	@Test
	def void sePuedeSugerirRecetaAUnGrupo(){
		Assert.assertTrue(grupoConHipertenso.tePuedoSugerirEstaReceta(arrozBlanco))
	}
	
	@Test
	def void noSePuedeSugerirRecetaAUnGrupo(){
		Assert.assertFalse(grupoConHipertenso.tePuedoSugerirEstaReceta(ensalada))
	}
}