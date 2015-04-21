package ar.tp.dieta

import org.junit.Before

class TestUsuarioInteractuaRecetas {

	Usuario usuarioDePruebas

	RecetarioPublico recetario

	Receta polloAsado
	Receta papasEspañolas

	Comida patitas = new Comida("patitas", 232)
	Comida sal = new Comida("sal", 90)
	Comida ajo = new Comida("ajo", 2)

	@Before
	def void init() {

		polloAsado => [

			setNombreDeLaReceta("pollo asado")
			setCalorias(390)
			setProcesoDePreparacion("	1) Cocinar 2) Comer")
			setDificultadDePreparacion("jodida")
			setTemporadaALaQueCorresponde("jueves santo")

			agregarIngrediente(patitas)
			agregarCondimento(sal)
			agregarCondimento(ajo)
		]
		
		usuarioDePruebas => [
			setNombre("Jose")
			setPeso(90.0)
			setAltura(1.85)

			setFechaDeNacimiento(1966, 3, 17)
			setRutina(new RutinaActiva)
			agregarCondicion(new CondicionVegano)
		]

	}
}