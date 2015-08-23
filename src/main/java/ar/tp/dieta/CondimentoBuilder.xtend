package ar.tp.dieta

class CondimentoBuilder {

	Condimento condimento

	new(String nombreCondimento){
		condimento = new Condimento()
		condimento.setNombre(nombreCondimento)
	}		

	public def CondimentoBuilder cantidad(int cantidad){
		condimento.setCantidad(cantidad)
		return this
	}
	
	public def Condimento build(){
		return condimento
	}
	
}