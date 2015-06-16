package ar.tp.dieta

import org.junit.Before

abstract class TestRepositorio {

	//Testeado OK

	protected Ingrediente pollo
	protected Ingrediente arroz
	protected Ingrediente azafran
	protected Ingrediente sal
	protected Ingrediente cebolla
	protected Ingrediente lomo
	protected Ingrediente azucar
	protected Ingrediente cereal
	protected Ingrediente pasta
	protected Ingrediente mostaza
	protected Ingrediente manteca
	protected Ingrediente gelatina
	protected Ingrediente tomate
	protected Ingrediente lechuga
	
	protected Receta arrozConPollo	
	protected Receta lomoMostaza
	protected Receta fideosConManteca
	protected Receta gelatinaFrambuesa
	protected Receta ensalada
	protected Receta arrozBlanco
	
	
	protected RecetarioPublico recetarioPublico
	
	protected Usuario usuarioVegano
	protected Usuario usuarioHipertenso
	protected Usuario usuarioSinCondicion
	protected Usuario usuarioCeliaco
	protected Usuario usuarioDiabetico
	protected Usuario usuarioMujerDiabetica
	protected Usuario usuarioMujerSinCondicion
	
	protected Grupo	grupoHipertenso = new Grupo

	protected RutinaActiva taeBo
	protected RutinaActiva basket
	protected RutinaSedentaria gaming
	protected RutinaSedentaria programacion
	
	protected Busqueda busqueda
	
	@Before
	public def void init(){

		//Instancio ingredientes.
		arroz = new IngredienteBuilder("arroz").cantidad(500).build()
		azafran = new IngredienteBuilder("azafran").cantidad(2).build()
		pollo = new IngredienteBuilder("pollo").cantidad(1000).build()
		lomo = new IngredienteBuilder("lomo").cantidad(1000).build()
		azucar = new IngredienteBuilder("azucar").cantidad(500).build()
		pasta = new IngredienteBuilder("pasta").cantidad(500).build()
		sal = new IngredienteBuilder("sal").cantidad(2).build()
		cebolla = new IngredienteBuilder("cebolla").cantidad(150).build()
		mostaza = new IngredienteBuilder("mostaza").cantidad(30).build()
		manteca= new IngredienteBuilder("manteca").cantidad(10).build()
		gelatina= new IngredienteBuilder("gelatina").cantidad(250).build()
		tomate = new IngredienteBuilder("tomate").cantidad(150).build()
		lechuga = new IngredienteBuilder("lechuga").cantidad(300).build()
				
		//Instancio recetas
		arrozConPollo = new RecetaBuilder("Arroz con Pollo").calorias(500).autor("Carlos Nahir").dificultad("Mediana").procesoPreparacion("Hervir el arroz con azafran y agregar el pollo previamente salteado").temporada("Invierno").agregar(arroz).agregar(pollo).agregar(azafran).build()
		fideosConManteca = new RecetaBuilder("Fideos con manteca").calorias(600).autor("Narda Lepes").dificultad("Facil").procesoPreparacion("Hervir los fideos. Colar.").temporada("Invierno").agregar(pasta).agregar(sal).agregar(manteca).build()
		lomoMostaza = new RecetaBuilder("Lomo a la Mostaza").calorias(1200).autor("Mirtha Legrand").dificultad("Dificil").procesoPreparacion("Poner el lomo con la mostaza en el horno.").temporada("Verano").agregar(lomo).agregar(sal).agregar(mostaza).build()
		gelatinaFrambuesa = new RecetaBuilder("Gelatina de Frambuesa").calorias(120).autor("Dolly").dificultad("Facil").procesoPreparacion("Mezclar gelatina azucar y agua").temporada("Verano").agregar(gelatina).agregar(azucar).build()
		ensalada = new RecetaBuilder("Ensalada").calorias(10).autor("Antonio Gasalla").dificultad("Facil").procesoPreparacion("Cortar la verdura y mezclar. No olvidar de lavar").temporada("Verano").agregar(cebolla).agregar(lechuga).agregar(tomate).agregar(sal).build()
		arrozBlanco = new RecetaBuilder("Arroz Blanco").calorias(10).autor("Antonio Gasalla").dificultad("Facil").procesoPreparacion("Hervir el arroz. Comer.").temporada("Invierno").agregar(arroz).build()
	

		//Recetario publico
		recetarioPublico = new RecetarioPublico
		recetarioPublico.recetas.add(arrozConPollo)
		recetarioPublico.recetas.add(lomoMostaza)

		busqueda = new Busqueda
		

		//Instancio Rutinas
		taeBo = new RutinaActiva => [
			setTiempoDeEjercicio(90)
		]
		
		gaming = new RutinaSedentaria => [
			setTiempoDeEjercicio(0)
		]
		
		programacion = new RutinaSedentaria => [
			setTiempoDeEjercicio(30)
		]
		
		basket = new RutinaActiva => [
			setTiempoDeEjercicio(240)
		]
		
		//Instancio Rutinas
		//Condicion Vegano
		usuarioVegano = new UsuarioBuilder("Miguel").peso(70.5).altura(1.73).fechaNacimiento(1989, 6, 28).sexo("M").rutina(basket).condicion(new CondicionVegano).preferencia("fruta").email("soyvegano@edrans.com").build()

		//Sin Condicion
		//Hombre
		usuarioSinCondicion = new UsuarioBuilder("Juan").peso(70.4).altura(1.83).fechaNacimiento(1992, 6, 4).sexo("M").rutina(gaming).preferencia("carne").preferencia("pescado").email("usuariosincondicion@mail.com").build()
		//Mujer
		usuarioMujerSinCondicion = new UsuarioBuilder("Marcela").peso(60.4).altura(1.83).fechaNacimiento(1992, 6, 4).sexo("F").rutina(basket).preferencia("carne").preferencia("pescado").email("mujersincondicion@test.com").build()
		
		//Condicion Celiaco
		usuarioCeliaco = new UsuarioBuilder("Daniel").peso(103.1).altura(1.85).fechaNacimiento(1992, 11, 20).sexo("M").rutina(basket).condicion(new CondicionCeliaco).preferencia("fideos").email("userceliaco@email.com").build()
		
		//Condicion Hipertenso		
		usuarioHipertenso = new UsuarioBuilder("Gabriel").peso(83.8).altura(1.83).fechaNacimiento(1987, 1, 8).sexo("M").rutina(taeBo).preferencia("limon").condicion(new CondicionHipertension).email("usuariohipertenso@mail.com").build()
	
		//Condicion Diabetico
		//Hombre
		usuarioDiabetico = new UsuarioBuilder("Nicolas").peso(78.8).altura(1.76).fechaNacimiento(1980, 2, 12).sexo("M").rutina(programacion).condicion(new CondicionDiabetes).preferencia("ensalada").email("usuariodiabetico@tutopia.com").build()
		//Mujer
		usuarioMujerDiabetica  = new UsuarioBuilder("Marina").peso(55.8).altura(1.66).fechaNacimiento(1965, 2, 12).sexo("F").rutina(taeBo).condicion(new CondicionDiabetes).preferencia("fruta").email("mujerdiabetica@gratis1.com").build()

		
	}	
		
		
}