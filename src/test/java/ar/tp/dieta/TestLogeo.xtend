package ar.tp.dieta

import org.junit.Before
import org.junit.Test
import queComemos.entrega3.dominio.Dificultad
import queComemos.entrega3.repositorio.RepoRecetas

class TestLogeo extends TestRepositorio{
	
	public RepoRecetas repo
	
	@Before 
	def void initPreparacion() {
		repo = new RepoRecetas
		repo.crearRepoRecetas
	}
		
	@Test
	def void PruebaDeLogeo(){
		usuarioSinCondicion.agregarAccion(new LogeoConsultas)
		usuarioSinCondicion.agregarAccion(new EnvioMail)
		usuarioSinCondicion.getRecetas(repo,Dificultad.FACIL)
	}
}