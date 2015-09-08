package ar.tp.dieta

import org.uqbar.commons.model.UserException

class RecetaBuilder {
	
	public static String FACIL = "Facil" 
	public static String MEDIA = "Media"
	public static String DIFICIL = "Dificil"
	public static String OTOÑO = "Otoño"
	public static String VERANO = "Verano"
	public static String PRIMAVERA = "Primavera"
	public static String INVIERNO = "Invierno"
	public static String TODOELAÑO = "Todo el año"

	Receta receta
	
	new(String nombreReceta){
		receta = new Receta()
		receta.setNombreDeLaReceta(nombreReceta)
	}		

	public def RecetaBuilder calorias(double calorias){
		receta.setCalorias(calorias)
		return this
	}
	
	public def RecetaBuilder autor(String autor){
		receta.setAutor(autor)
		return this
	}
	
	public def RecetaBuilder dificultad(String dificultad){
		receta.setDificultadDePreparacion(dificultad)
		return this
	}
	
	public def RecetaBuilder procesoPreparacion(String procesoPreparacion){
		receta.setProcesoDePreparacion(procesoPreparacion)
		return this
	}
	
	public def RecetaBuilder temporada(String temporada){
		receta.setTemporadaALaQueCorresponde(temporada)
		return this
	}
	
	public def RecetaBuilder agregarIngrediente(Ingrediente unIngrediente){
		receta.agregarIngrediente(unIngrediente)
		return this
	}
	
	public def RecetaBuilder agregarCondimento(Condimento unCondimento){
		receta.agregarCondimento(unCondimento)
		return this
	}

	public def Receta build(){
		
		if(receta.nombreDeLaReceta.length.equals(0)){
			throw new UserException("El nombre no puede estar vacio")
		}else{
			return receta
		}
	}
}