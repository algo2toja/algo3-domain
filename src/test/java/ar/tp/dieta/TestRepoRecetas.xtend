package ar.tp.dieta

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class TestRepoRecetas {

	public Ingrediente pollo
	public Ingrediente arroz
	public Ingrediente azafran
	public Ingrediente sal
	public Ingrediente cebolla
	public Ingrediente lomo
	public Ingrediente azucar
	public Ingrediente cereal
	public Ingrediente pasta
	public Ingrediente mostaza
	public Ingrediente manteca
	public Ingrediente gelatina
	
	public Receta arrozConPollo	
	public Receta lomoMostaza
	public Receta fideosConManteca
	public Receta gelatinaFrambuesa
	
	public RecetarioPublico recetarioPublico
		
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

		//Instancio recetas
		arrozConPollo = new RecetaBuilder("Arroz con Pollo").calorias(500).autor("Carlos Nahir").dificultad("Mediana").procesoPreparacion("Hervir el arroz con azafran y agregar el pollo previamente salteado").temporada("Invierno").agregar(arroz).agregar(pollo).agregar(azafran).build()
		fideosConManteca = new RecetaBuilder("Fideos con manteca").calorias(600).autor("Narda Lepes").dificultad("Facil").procesoPreparacion("Hervir los fideos. Colar.").temporada("Invierno").agregar(pasta).agregar(sal).agregar(manteca).build()
		lomoMostaza = new RecetaBuilder("Lomo a la Mostaza").calorias(1200).autor("Mirtha Legrand").dificultad("Dificil").procesoPreparacion("Poner el lomo con la mostaza en el horno.").temporada("Verano").agregar(lomo).agregar(sal).agregar(mostaza).build()
		gelatinaFrambuesa = new RecetaBuilder("Gelatina de Frambuesa").calorias(120).autor("Dolly").dificultad("Facil").procesoPreparacion("Mezclar gelatina azucar y agua").temporada("Verano").agregar(gelatina).agregar(azucar).build()

		recetarioPublico = new RecetarioPublico
		recetarioPublico.recetas.add(arrozConPollo)
		recetarioPublico.recetas.add(lomoMostaza)
		recetarioPublico.recetas.add(fideosConManteca)
		recetarioPublico.recetas.add(gelatinaFrambuesa)

	}	
		
		
}