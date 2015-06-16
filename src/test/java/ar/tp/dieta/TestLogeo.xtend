package ar.tp.dieta

import org.junit.Before
import org.junit.Test
import queComemos.entrega3.dominio.Dificultad
import queComemos.entrega3.repositorio.RepoRecetas
import org.junit.Assert

class TestLogeo extends TestRepositorio{
	
	public RepoRecetas repo
	
	@Before 
	def void initPreparacion() {
		repo = new RepoRecetas
		repo.crearRepoRecetas
	}
		
	@Test
	def void pruebaDeConsultaMail(){
		usuarioVegano.agregarAccion(new EnvioMail) //Usuario con nombre Miguel puede enviar mail.
		usuarioVegano.getRecetas(repo,"pure mixto", Dificultad.MEDIANA)
		usuarioVegano.getRecetas(repo,"pure mixto", Dificultad.FACIL)
	}	
	
	@Test
	def void pruebaDeLogeo(){
		usuarioSinCondicion.agregarAccion(new LogeoConsultas)
		usuarioSinCondicion.agregarAccion(new EnvioMail)
		usuarioSinCondicion.getRecetas(repo, "pure mixto", Dificultad.MEDIANA) //Loguea
		usuarioSinCondicion.getRecetas(repo, "pure mixto", Dificultad.FACIL) //No loguea
	}
	
	@Test
	def void pruebaDeAgregarAFavs(){
		usuarioSinCondicion.agregarResultadosDeConsultasAFavoritos //Habilito por el lado de usuario
		usuarioSinCondicion.agregarAccion(new AgregaResultadosAFavoritos)
		usuarioSinCondicion.getRecetas(repo, "pure mixto", Dificultad.MEDIANA)
		Assert.assertTrue(usuarioSinCondicion.contenesEstaRecetaEnFavs("pure mixto")) //La receta esta
		Assert.assertFalse(usuarioSinCondicion.contenesEstaRecetaEnFavs("pato a la naranja")) //No esta
	}
	
}