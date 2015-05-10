package ar.tp.dieta

abstract class FiltroDecorator implements Filtro {
	
	Filtro decorado
	
	new(Filtro filtro) {
		decorado = filtro
	}
	
	override getRecetasFromUsuario(Usuario unUsuario){
		decorado.getRecetasFrom(unUsuario)
	}


	override getRecetasFromGrupo(Grupo unGrupo)
	override aplicarFiltro()
	override getFiltro()
	
	
	override pagarVencimiento(int monto) {
		decorado.pagarVencimiento(monto)
	}
	
	override getPuntos() {
		decorado.puntos
	} 
	
	override getSaldo() {
		decorado.saldo
	}
	
	override esMoroso() {
		saldo > 0
	} 
	
}