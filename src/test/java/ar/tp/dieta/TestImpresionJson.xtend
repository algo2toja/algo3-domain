package ar.tp.dieta

import queComemos.entrega3.repositorio.RepoRecetas
import org.junit.Before
import org.junit.Test
import org.eclipse.xtend.lib.annotations.Accessors
import queComemos.entrega3.repositorio.BusquedaRecetas
import queComemos.entrega3.dominio.Dificultad

@Accessors
class TestImpresionJson {
	RepoRecetas repo
	BusquedaRecetas busqueda
	Dificultad mediana
	JsonSimpleReader jsonReader
	
	@Before
	def void init(){
		repo = new RepoRecetas => [
			crearRepoRecetas
		]
		
		jsonReader = new JsonSimpleReader
		
		busqueda = new BusquedaRecetas => [
			setNombre("ensalada")
		]
	}

	@Test
	def void testRepo(){
		println(jsonReader.parseJsonNombre(repo.getRecetas(busqueda)))
	}
		
}
