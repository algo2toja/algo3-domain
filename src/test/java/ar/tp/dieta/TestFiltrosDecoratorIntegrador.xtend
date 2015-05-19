package ar.tp.dieta

import org.junit.Before
import org.junit.Test
import java.util.ArrayList
import java.util.List
import org.junit.Assert

class TestFiltrosDecoratorIntegrador {

	Grupo grupo = new Grupo
	
	RecetarioPublico recetario = new RecetarioPublico
	
		// ###### USUARIOS #######
	Usuario usuarioAFiltrar = new Usuario
	Usuario usuarioCompañero = new Usuario
	
		// ###### RECETAS ########
	Receta recetaExedidaCalorias = new Receta
	Receta recetaConSal = new Receta
	Receta recetaFea = new Receta
	Receta recetaCara = new Receta
	
	Receta relleno1 = new Receta
	Receta relleno2 = new Receta
	Receta relleno3 = new Receta
	Receta relleno4 = new Receta
	Receta relleno5 = new Receta
	
		// ###### INGREDIENTES ######
	Ingrediente sal = new Ingrediente
	Ingrediente salmon = new Ingrediente
	Ingrediente algoFeo = new Ingrediente
	Ingrediente papa = new Ingrediente
	
	@Before
	def void init(){
		grupo.agregarUsuario(usuarioAFiltrar)
		grupo.agregarUsuario(usuarioCompañero)
		usuarioAFiltrar.misGrupos.add(grupo)
		usuarioCompañero.misGrupos.add(grupo)
		
		usuarioAFiltrar.recetario = recetario
		usuarioCompañero.recetario = recetario
		
		usuarioCompañero.misRecetas.add(recetaExedidaCalorias)
		usuarioAFiltrar.misRecetas.add(recetaCara)
		
		usuarioAFiltrar.agregarComidaQueMeDisgusta("feo")
		
		usuarioAFiltrar.setPeso(150.0)
		usuarioAFiltrar.setAltura(1.2)
		usuarioAFiltrar.condicionesPreexistentes.add(new CondicionHipertension)
		
		recetario.agregarReceta(recetaConSal)
		recetario.agregarReceta(recetaFea)
		
		recetaConSal.agregarIngrediente(sal)
		recetaCara.agregarIngrediente(salmon)
		recetaFea.agregarIngrediente(algoFeo)
		recetaExedidaCalorias.calorias = 600
		
		sal.setNombre("sal")
		salmon.setNombre("salmon")
		algoFeo.setNombre("feo")
		
		
		
		
		relleno1.setCalorias(300)
		usuarioCompañero.misRecetas.add(relleno1)
		
		papa.setNombre("papa")
		relleno2.agregarIngrediente(papa)
		recetario.agregarReceta(relleno2)
		
		relleno3.agregarSubreceta(relleno4)
		relleno4.agregarSubreceta(relleno5)
		usuarioAFiltrar.misRecetas.add(relleno3)
		
		
		
	}
	
	@Test
	def testAplicandoTodosLosFiltros(){
		var List<Receta> recetasFiltradas = new ArrayList<Receta>
		var Filtro filtro = new FiltroPorIngredienteCaro(
									new FiltroPorGustos(
										new FiltroPorCondicion(
											new FiltroExcesoDeCalorias(
												new FiltroBase))))
		
		recetasFiltradas = filtro.aplicarFiltro(usuarioAFiltrar)
		
		Assert.assertTrue(recetasFiltradas.contains(relleno1))
		Assert.assertTrue(recetasFiltradas.contains(relleno2))
		Assert.assertTrue(recetasFiltradas.contains(relleno3))
		
		Assert.assertFalse(recetasFiltradas.contains(recetaExedidaCalorias))
		Assert.assertFalse(recetasFiltradas.contains(recetaConSal))
		Assert.assertFalse(recetasFiltradas.contains(recetaFea))
		Assert.assertFalse(recetasFiltradas.contains(recetaCara))
	}
}