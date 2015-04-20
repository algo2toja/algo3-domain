package ar.tp.dieta

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Receta {
	
	String nombreDeLaReceta
	int calorias
	List<Comida> ingredientes // tanto ingredientes como condimentos son clase comida?
	List<Comida> condimentos
	String procesoDePreparacion
	String dificultaDePreparacion
	String temporadaALaQueCorresponde
	List<Receta> subRecetas
	
	def void agregarIngrediente(Comida unaComida){
		ingredientes.add(unaComida)
	}
	
	def void agregarCondimento(Comida unCondimento){
		condimentos.add(unCondimento)
	}
	
	def void removerIngrediente(Comida unaComida){
		ingredientes.remove(unaComida)
	}
	
	def void removerCondimento(Comida unCondimento){
		condimentos.remove(unCondimento)
	}
	
	def validar() {
		this.validarCalorias && !ingredientes.empty
	}

	def validarCalorias() {
		10>=this.getCalorias && this.getCalorias<=5000
	}

	def List<Condicion> inadecuadaParaCondiciones() {
		//Devuelve la lista de condiciones preexistentes para la que no son recomendadas las comidas con que se prepara la receta.
		ingredientes.map[noSeRecomiendaParaCondiciones()]
	}
	
	def agregarSubreceta(Receta unaSubreceta){
		subRecetas.add(unaSubreceta)
	}
	
}