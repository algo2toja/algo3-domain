package ar.tp.dieta


import org.junit.Test
import org.junit.Assert
import java.util.List
import java.util.ArrayList
import queComemos.entrega3.dominio.Dificultad
import org.junit.Before
import queComemos.entrega3.repositorio.RepoRecetas

class TestEntregaTresConsultaJson extends TestRepositorio{
	
	public RepoRecetas repo
	
	@Before 
	def void initPreparacion() {
		repo = new RepoRecetas
		repo.crearRepoRecetas
	}
		
	@Test
	def void comprobarJsonEImprimir(){
		val List<String> pClave = new ArrayList<String>
		pClave.add("carne")
		usuarioVegano.getRecetas(repo, "pure mixto")
	}
	
	@Test
	def void comprobarJsonMasConsultado(){
		var ConsultasDificilesDeVeganoObserver consultaVegano = new ConsultasDificilesDeVeganoObserver
		var ConsultaRecetaMasConsultadaObserver consultaRecetaMasConsultada = new ConsultaRecetaMasConsultadaObserver
		usuarioSinCondicion.agregarCondicion(new CondicionVegano)
		val List<String> pClave = new ArrayList<String>
		pClave.add("papa")
		usuarioSinCondicion.observadores.add(consultaVegano)
		usuarioSinCondicion.observadores.add(consultaRecetaMasConsultada)
		Assert.assertTrue(consultaVegano.mostrarCantidadDeVeganos.equals(0))
		usuarioSinCondicion.getRecetas(repo, "pure mixto", Dificultad.MEDIANA, pClave)
		usuarioSinCondicion.getRecetas(repo, "canelones de ricota y verdura")
		usuarioSinCondicion.getRecetas(repo, "canelones de ricota y verdura")
		Assert.assertTrue(consultaVegano.mostrarCantidadDeVeganos.equals(0))
		Assert.assertFalse(consultaRecetaMasConsultada.recetaMasConsultada.equals("canelones de ricota y verdura"))
	}
	
	@Test
	def void comprobarJsonPorSexoHombre(){ //FIXEAR
		var ConsultaRecetaMasConsultadaPorSexoObserver consultaPorSexo = new ConsultaRecetaMasConsultadaPorSexoObserver
		val List<String> pClave = new ArrayList<String>
		pClave.add("papa")
		usuarioHipertenso.observadores.add(consultaPorSexo)
		usuarioDiabetico.observadores.add(consultaPorSexo)
		usuarioHipertenso.getRecetas(repo, "ensalada lechuga agridulce")
		usuarioHipertenso.getRecetas(repo, "pure mixto", Dificultad.MEDIANA, pClave)
		usuarioDiabetico.getRecetas(repo, "pure mixto", Dificultad.MEDIANA, pClave)
		Assert.assertTrue(consultaPorSexo.recetasMasConsultadasHombres.equals("pure mixto")) //ESTA LINEA <<<
	}
	
	@Test		
	def void comprobarJsonPorHora(){
		var ConsultasPorHoraObserver consultaPorHora = new ConsultasPorHoraObserver
		val List<String> pClave = new ArrayList<String>
		pClave.add("azucar")
		usuarioHipertenso.observadores.add(consultaPorHora)
		usuarioHipertenso.getRecetas(repo, "sushi")
		Assert.assertTrue(consultaPorHora.mostrarConsultasDeHora(20).equals(1)) //FUNCIONA SEGUN LA HORA DE LA PC!!
	}		
			
}