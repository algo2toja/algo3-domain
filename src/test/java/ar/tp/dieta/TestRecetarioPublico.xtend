package ar.tp.dieta

import org.junit.Assert
import org.junit.Before
import org.junit.Test

class TestUsuarioInteractuaRecetas {

	Usuario usuarioDePruebas

	RecetarioPublico recetario = new RecetarioPublico

	Receta polloAsado
	Receta papasEspañolas
	Receta pure
	
	Ingrediente lechuga
	Ingrediente patitas
	Ingrediente papa
	Ingrediente sal
	Ingrediente ajo

	@Before
	def void init() {
		
		lechuga = new Ingrediente => [
			setCantidad(1)
			setNombre("lechuga")
		]
		
		patitas = new Ingrediente => [
			setCantidad(232)
			setNombre("patitas")
		]
		
		papa = new Ingrediente => [
			setCantidad(5)
			setNombre("papa")
		]
		
		sal = new Ingrediente =>[ 
			setCantidad(90)
			setNombre("sal")
		]
		
		ajo = new Ingrediente => [
			setCantidad(2)
			setNombre("ajo")
		]	

		pure = new Receta => [
			cambiarNombre("pure")
			setCalorias(100)
			setProcesoDePreparacion(" 1) Papar 2) Comer papa")
			setDificultadDePreparacion("facil")
			setTemporadaALaQueCorresponde("Todo el año")
			agregarIngrediente(papa)
			agregarCondimento(sal)
		]

		polloAsado = new Receta => [
			cambiarNombre("pollo asado")
			setCalorias(390)
			setProcesoDePreparacion("	1) Cocinar 2) Comer")
			setDificultadDePreparacion("jodida")
			setTemporadaALaQueCorresponde("jueves santo")

			agregarIngrediente(patitas)
			agregarCondimento(sal)
			agregarCondimento(ajo)
		]
		
		papasEspañolas = new Receta => [

			cambiarNombre("papas españolas")
			setCalorias(10)
			setProcesoDePreparacion("1) Cocinar 2) Papar")
			setDificultadDePreparacion("extrema")
			setTemporadaALaQueCorresponde("Todo el año")

			agregarIngrediente(patitas)
			agregarCondimento(sal)
			agregarCondimento(ajo)
			
		]
		
		usuarioDePruebas = new Usuario => [
			setNombre("Jose")
			setPeso(90.0)
			setAltura(1.85)

			setFechaDeNacimiento(1966, 3, 17)
			setRutina(new RutinaActiva)
			agregarCondicion(new CondicionVegano)
		]
		
		recetario.agregarReceta(polloAsado)
		recetario.agregarReceta(papasEspañolas)
		polloAsado.agregarSubreceta(pure)
		
	}
	
	@Test
	//Ver si recetario tiene dos recetas
	def void recetarioConDosRecetas(){
		Assert.assertTrue(recetario.recetas.size().equals(2))
	
	//Usuario agrega una de esas recetas a su recetario, la modifica, y revisa que esos cambios no afecten a la publica
		
		usuarioDePruebas.agregarRecetaPublicaAMiColeccion("pollo asado",recetario)
		Assert.assertTrue(usuarioDePruebas.misRecetas.size == 1)
		usuarioDePruebas.modificarReceta("pollo asado","pollito",0,"0","0","0")
		Assert.assertTrue((usuarioDePruebas.devolverReceta("pollito")).devolverNombre() == "pollito")	
		Assert.assertTrue((recetario.elegirReceta("pollo asado")).devolverNombre() == "pollo asado")
		usuarioDePruebas.devolverReceta("pollito").agregarIngrediente(lechuga)
		Assert.assertTrue((usuarioDePruebas.devolverReceta("pollito")).elementosDeReceta.contains(lechuga))	
		Assert.assertFalse((recetario.elegirReceta("pollo asado")).elementosDeReceta.contains(lechuga))
		Assert.assertTrue((recetario.elegirReceta("pollo asado")).elementosDeReceta.size.equals(1))
		Assert.assertTrue((usuarioDePruebas.devolverReceta("pollito")).elementosDeReceta.size.equals(1))
		usuarioDePruebas.devolverSubReceta("pollito","pure").setNombre("papada")
		Assert.assertTrue((usuarioDePruebas.devolverSubReceta("pollito","papada")).getNombre() == "papada")
	}
	
}