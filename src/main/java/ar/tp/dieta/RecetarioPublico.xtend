package ar.tp.dieta

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class RecetarioPublico implements Cloneable{
	List<Receta> recetas = new ArrayList<Receta>()
	public Receta lomoMostaza
	public Receta arrozConPollo	
	public Receta fideosConManteca
	public Receta gelatinaFrambuesa
	public Receta ensalada
	public Receta arrozBlanco


	new(){
		arrozConPollo = new RecetaBuilder("Arroz con Pollo").calorias(500).autor("Carlos Nahir").dificultad(RecetaBuilder.FACIL).procesoPreparacion("Hervir el arroz con azafran y agregar el pollo previamente salteado").temporada(RecetaBuilder.INVIERNO).agregarIngrediente(new IngredienteBuilder("arroz").cantidad(500).build()).agregarIngrediente(new IngredienteBuilder("pollo").cantidad(1000).build()).agregarCondimento(new CondimentoBuilder("azafran").cantidad(2).build()).build()
		fideosConManteca = new RecetaBuilder("Fideos con manteca").calorias(600).autor("Narda Lepes").dificultad(RecetaBuilder.MEDIA).procesoPreparacion("Hervir los fideos. Colar.").temporada(RecetaBuilder.INVIERNO).agregarIngrediente(new IngredienteBuilder("pasta").cantidad(500).build()).agregarCondimento(new CondimentoBuilder("sal").cantidad(2).build()).agregarIngrediente(new IngredienteBuilder("manteca").cantidad(10).build()).build()
		lomoMostaza = new RecetaBuilder("Lomo a la Mostaza").calorias(1200).autor("Mirtha Legrand").dificultad(RecetaBuilder.DIFICIL).procesoPreparacion("Poner el lomo con la mostaza en el horno.").temporada(RecetaBuilder.VERANO).agregarIngrediente(new IngredienteBuilder("lomo").cantidad(1000).build()).agregarCondimento(new CondimentoBuilder("sal").cantidad(2).build()).agregarCondimento(new CondimentoBuilder("mostaza").cantidad(30).build()).build()
		gelatinaFrambuesa = new RecetaBuilder("Gelatina de Frambuesa").calorias(120).autor("Dolly").dificultad(RecetaBuilder.FACIL).procesoPreparacion("Mezclar gelatina azucar y agua").temporada(RecetaBuilder.VERANO).agregarIngrediente(new IngredienteBuilder("gelatina").cantidad(250).build()).agregarCondimento(new CondimentoBuilder("azucar").cantidad(500).build()).build()
		ensalada = new RecetaBuilder("Ensalada").calorias(10).autor("Antonio Gasalla").dificultad(RecetaBuilder.FACIL).procesoPreparacion("Cortar la verdura y mezclar. No olvidar de lavar").temporada(RecetaBuilder.PRIMAVERA).agregarIngrediente(new IngredienteBuilder("cebolla").cantidad(150).build()).agregarIngrediente(new IngredienteBuilder("lechuga").cantidad(300).build()).agregarIngrediente(new IngredienteBuilder("tomate").cantidad(150).build()).agregarCondimento(new CondimentoBuilder("sal").cantidad(2).build()).build()
		arrozBlanco = new RecetaBuilder("Arroz Blanco").calorias(10).autor("Antonio Gasalla").dificultad(RecetaBuilder.FACIL).procesoPreparacion("Hervir el arroz. Comer.").temporada(RecetaBuilder.OTOÑO).agregarIngrediente(new IngredienteBuilder("arroz").cantidad(500).build()).build()
		recetas.add(arrozConPollo)
		recetas.add(fideosConManteca)
		recetas.add(lomoMostaza)
		recetas.add(gelatinaFrambuesa)
		recetas.add(arrozBlanco)
		recetas.add(ensalada)
	}
	
	def void agregarReceta(Receta unaReceta) {
		//agrega recetas al recetario
		recetas.add(unaReceta)
	}

	def void mirarRecetario() {
		//imprime los nombres de las recetas
		recetas.forEach[receta|println(receta.getNombreDeLaReceta)]
	}

	def elegirReceta(String nombre) {
		if(this.busquedaReceta(nombre)==null){
			throw new BusinessException("La receta buscada no existe.")
		}
		this.busquedaReceta(nombre)
		// devuelve la primer receta que conincide con el nombre pasado
		
	}
	
	def busquedaReceta(String nombreReceta){
		recetas.findFirst[receta|receta.getNombreDeLaReceta.equals(nombreReceta)]
	}
	
/*copiarReceta inicializa una nueva variable recetaTemporal, a 
 * la que se le va a asignar la coincidencia de buscar la receta
 * requerida en el listado de recetas (metodo busquedaReceta)
 * luego se copiaran todos los atributos 1x1 de una receta a otra y
 *  se retornara la nueva Receta con todos los atributos copiados*/
	
	def Receta copiarReceta(Receta unaReceta, String nombreReceta){
		var Receta recetaTemporal = this.busquedaReceta(nombreReceta)
		
		unaReceta.setNombreDeLaReceta(recetaTemporal.getNombreDeLaReceta())
		unaReceta.setCalorias(recetaTemporal.getCalorias())
		unaReceta.setProcesoDePreparacion(recetaTemporal.getProcesoDePreparacion())
		unaReceta.setDificultadDePreparacion(recetaTemporal.getDificultadDePreparacion())
		unaReceta.setTemporadaALaQueCorresponde(recetaTemporal.getTemporadaALaQueCorresponde())
		//unaReceta.subRecetas = recetaTemporal.subRecetas.clone()
		
		//Workaround para ArrayList, en vez de usar clone se inicializa un nuevo ArrayList con el mismo contenido que recetaTemporal
		unaReceta.ingredientes = new ArrayList<Ingrediente>(recetaTemporal.ingredientes)
		unaReceta.condimentos = new ArrayList<Condimento>(recetaTemporal.condimentos)
		
		//Devuelvo el objeto
		unaReceta
	}
	
}