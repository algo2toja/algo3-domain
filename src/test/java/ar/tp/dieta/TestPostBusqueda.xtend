package ar.tp.dieta

import org.junit.Before
import org.junit.Test
import java.util.ArrayList
import java.util.List
import org.junit.Assert

class TestPostBusqueda {
	Usuario usuarioPruebas = new Usuario
	
	Filtro filtro = new FiltroBase
	
	Receta receta1 = new Receta
	Receta receta2 = new Receta
	Receta receta3 = new Receta
	Receta receta4 = new Receta
	Receta receta5 = new Receta
	Receta receta6 = new Receta
	Receta receta7 = new Receta
	Receta receta8 = new Receta
	Receta receta9 = new Receta
	Receta receta10 = new Receta
	Receta receta11 = new Receta
	
	RecetarioPublico recetario = new RecetarioPublico
	
	@Before
	def void init(){
		recetario.agregarReceta(receta1)
		recetario.agregarReceta(receta2)
		recetario.agregarReceta(receta3)
		recetario.agregarReceta(receta4)
		recetario.agregarReceta(receta5)
		recetario.agregarReceta(receta6)
		recetario.agregarReceta(receta7)
		recetario.agregarReceta(receta8)
		recetario.agregarReceta(receta9)
		recetario.agregarReceta(receta10)
		recetario.agregarReceta(receta11)
		
		usuarioPruebas.setRecetario(recetario)
		
		receta1.setCalorias(50)
		receta2.setCalorias(20)
		receta3.setCalorias(40)
		receta4.setCalorias(30)
		receta5.setCalorias(80)
		receta6.setCalorias(60)
		receta7.setCalorias(120)
		receta8.setCalorias(100)
		receta9.setCalorias(90)
		receta10.setCalorias(110)
		receta11.setCalorias(70)
	}
	
	@Test
	def losDiezPrimeros(){
		var List<Receta> lasDiezPrimeras = new ArrayList<Receta>
		var Filtro diezPrimeros = new PosteriorBusquedaDiezPrimeros(filtro)
		
		lasDiezPrimeras = diezPrimeros.aplicarFiltro(usuarioPruebas)
		
		Assert.assertTrue(lasDiezPrimeras.contains(receta1))
		Assert.assertTrue(lasDiezPrimeras.contains(receta2))
		Assert.assertTrue(lasDiezPrimeras.contains(receta3))
		Assert.assertTrue(lasDiezPrimeras.contains(receta4))
		Assert.assertTrue(lasDiezPrimeras.contains(receta5))
		Assert.assertTrue(lasDiezPrimeras.contains(receta6))
		Assert.assertTrue(lasDiezPrimeras.contains(receta7))
		Assert.assertTrue(lasDiezPrimeras.contains(receta8))
		Assert.assertTrue(lasDiezPrimeras.contains(receta9))
		Assert.assertTrue(lasDiezPrimeras.contains(receta10))
		Assert.assertFalse(lasDiezPrimeras.contains(receta11))//no contiene la 11
	}
	
	@Test
	def  losPares(){
		var List<Receta> pares = new ArrayList<Receta>
		var Filtro tomarPares = new PosteriorBusquedaPares(filtro)
		
		pares = tomarPares.aplicarFiltro(usuarioPruebas)
		
		Assert.assertTrue(pares.contains(receta1))	//	posicion 0 SI
		Assert.assertFalse(pares.contains(receta2))	//	posicion 1 NO
		Assert.assertTrue(pares.contains(receta3))	//	SI
		Assert.assertFalse(pares.contains(receta4))	//		NO
		Assert.assertTrue(pares.contains(receta5))	//	SI
		Assert.assertFalse(pares.contains(receta6))	//		NO
		Assert.assertTrue(pares.contains(receta7))	//	SI
		Assert.assertFalse(pares.contains(receta8))	//		NO
		Assert.assertTrue(pares.contains(receta9))	//	SI
		Assert.assertFalse(pares.contains(receta10))//		NO
		Assert.assertTrue(pares.contains(receta11)) //	SI
	}
	
	@Test
		def  OrdenPorCalorias(){
		var List<Receta> recetas = new ArrayList<Receta>
		var Filtro ordenarCalorias = new PosteriorBusquedaOrdenadoCalorias(filtro)
		
		recetas = ordenarCalorias.aplicarFiltro(usuarioPruebas)
		
		Assert.assertTrue(recetas.get(0).getCalorias.equals(20))
		Assert.assertTrue(recetas.get(1).getCalorias.equals(30))
		Assert.assertTrue(recetas.get(2).getCalorias.equals(40))
		Assert.assertTrue(recetas.get(3).getCalorias.equals(50))
		Assert.assertTrue(recetas.get(4).getCalorias.equals(60))
		Assert.assertTrue(recetas.get(5).getCalorias.equals(70))
		Assert.assertTrue(recetas.get(6).getCalorias.equals(80))
		Assert.assertTrue(recetas.get(7).getCalorias.equals(90))
		Assert.assertTrue(recetas.get(8).getCalorias.equals(100))
		Assert.assertTrue(recetas.get(9).getCalorias.equals(110))
		Assert.assertTrue(recetas.get(10).getCalorias.equals(120))
	}
	
	@Test
	def integracionFiltroMasProcesoPosterior(){
		var List<Receta> recetas = new ArrayList<Receta>
		var Filtro ordenarCalorias = new PosteriorBusquedaOrdenadoCalorias(filtro)
		
		receta1.setCalorias(650) //antes tenia 50
		receta2.setCalorias(501) //antes tenia 20
		receta3.setCalorias(750) //antes tenia 40
		receta4.setCalorias(900)//atntes tenia 30
		
		usuarioPruebas.setAltura(1.2)
		usuarioPruebas.setPeso(100.5)
		Assert.assertTrue(usuarioPruebas.tieneSobrepeso)
		
		recetas = ordenarCalorias.aplicarFiltro(usuarioPruebas)

		Assert.assertFalse(recetas.contains(receta1))
		Assert.assertFalse(recetas.contains(receta2))
		Assert.assertFalse(recetas.contains(receta3))
		Assert.assertFalse(recetas.contains(receta4))

		Assert.assertTrue(recetas.get(0).getCalorias.equals(60))
		Assert.assertTrue(recetas.get(1).getCalorias.equals(70))
		Assert.assertTrue(recetas.get(2).getCalorias.equals(80))
		Assert.assertTrue(recetas.get(3).getCalorias.equals(90))
		Assert.assertTrue(recetas.get(4).getCalorias.equals(100))
		Assert.assertTrue(recetas.get(5).getCalorias.equals(110))
		Assert.assertTrue(recetas.get(6).getCalorias.equals(120))
	}

}
