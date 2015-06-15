package ar.tp.dieta

class RecetaBuilder {

	Receta receta
	
	new(String nombreReceta){
		receta = new Receta()
		receta.setNombreDeLaReceta(nombreReceta)
	}		

	public def RecetaBuilder calorias(int calorias){
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
	
	public def RecetaBuilder agregar(Ingrediente unIngrediente){
		receta.agregarIngrediente(unIngrediente)
		return this
	}

	public def Receta build(){
		if (receta.elementosDeReceta.isEmpty()) {
			throw new BusinessException("Receta sin ingredientes")
		}
		return receta
	}
	
}