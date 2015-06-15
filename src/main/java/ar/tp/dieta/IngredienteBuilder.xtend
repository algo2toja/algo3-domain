package ar.tp.dieta

class IngredienteBuilder {

	Ingrediente ingrediente

	new(String nombreIngrediente){
		ingrediente = new Ingrediente()
		ingrediente.setNombre(nombreIngrediente)
	}		

	public def IngredienteBuilder cantidad(int cantidad){
		ingrediente.setCantidad(cantidad)
		return this
	}
	
	public def Ingrediente build(){
		return ingrediente
	}
	
}