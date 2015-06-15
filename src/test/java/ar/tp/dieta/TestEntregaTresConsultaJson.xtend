package ar.tp.dieta


import org.junit.Test
import org.junit.Assert
import java.util.List
import java.util.ArrayList
import queComemos.entrega3.dominio.Dificultad

class TestEntregaTresConsultaJson extends TestBase{
	
	@Test
	def void comprobarJsonEImprimir(){
		val List<String> pClave = new ArrayList<String>
		pClave.add("carne")
		usuarioNormal.getRecetas(repo, "pure mixto")
	}
	
	@Test
	def void comprobarJsonMasConsultado(){
		var ConsultasDificilesDeVeganoObserver consulta1 = new ConsultasDificilesDeVeganoObserver
		var ConsultaRecetaMasConsultadaObserver consulta2 = new ConsultaRecetaMasConsultadaObserver
		usuarioNormal.agregarCondicion(new CondicionVegano)
		val List<String> pClave = new ArrayList<String>
		pClave.add("papa")
		usuarioNormal.observadores.add(consulta1)
		usuarioNormal.observadores.add(consulta2)
		Assert.assertTrue(consulta1.mostrarCantidadDeVeganos.equals(0))
		usuarioNormal.getRecetas(repo, "pure mixto", Dificultad.MEDIANA, pClave)
		usuarioNormal.getRecetas(repo, "canelones de ricota y verdura")
		Assert.assertTrue(consulta1.mostrarCantidadDeVeganos.equals(1))
		Assert.assertTrue(consulta2.recetaMasConsultada.equals("canelones de ricota y verdura"))
	}
	
	@Test
	def void comprobarJsonPorSexoHombre(){
		var ConsultaRecetaMasConsultadaPorSexoObserver consulta1 = new ConsultaRecetaMasConsultadaPorSexoObserver
		val List<String> pClave = new ArrayList<String>
		pClave.add("papa")
		usuarioHipertenso.observadores.add(consulta1)
		usuarioHipertenso.getRecetas(repo, "ensalada lechuga agridulce")
		usuarioHipertenso.getRecetas(repo, "pure mixto", Dificultad.MEDIANA, pClave)
		Assert.assertTrue(consulta1.recetasMasConsultadasHombres.equals("pure mixto"))
	}
	
	@Test		
	def void comprobarJsonPorHora(){
		var ConsultasPorHoraObserver consulta1 = new ConsultasPorHoraObserver
		val List<String> pClave = new ArrayList<String>
		pClave.add("azucar")
		usuarioHipertenso.observadores.add(consulta1)
		usuarioHipertenso.getRecetas(repo, "sushi")
		Assert.assertTrue(consulta1.mostrarConsultasDeHora(15).equals(2))
	}		
			
}