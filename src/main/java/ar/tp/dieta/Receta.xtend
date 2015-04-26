package ar.tp.dieta

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList

@Accessors
class Receta implements Cloneable{

	String nombreDeLaReceta
	double calorias
	List<Ingrediente> ingredientes = new ArrayList<Ingrediente>()
	List<Condimento> condimentos = new ArrayList<Condimento>()
	String procesoDePreparacion
	String dificultadDePreparacion
	String temporadaALaQueCorresponde
	List<Receta> subRecetas = new ArrayList<Receta>()

	def void agregarIngrediente(Ingrediente unIngrediente){
		ingredientes.add(unIngrediente)
	}

	def void agregarCondimento(Condimento unCondimento) {
		condimentos.add(unCondimento)
	}

	def void removerIngrediente(Ingrediente unIngrediente) {
		ingredientes.remove(unIngrediente)
	}

	def void removerCondimento(Condimento unCondimento) {
		condimentos.remove(unCondimento)
	}

	def validar() {
		this.validarCalorias && !ingredientes.empty
	}

	def validarCalorias() {
		if(10 >= this.getCalorias && this.getCalorias <= 5000){
			throw new ArgumentException("Verificar la cantidad de calorias")
		}
		true
	}
	
	def List<Condicion> inadecuadaParaCondiciones() {
		// checkea por Diabetico, Hipertenso o Vegano, y agrega la condicion correspondiente
		// a la lista que devuelve.
		var List<Condicion> condicionesADevolver = new ArrayList<Condicion>()
		this.checkDiabetico(condicionesADevolver)
		this.checkHipertenso(condicionesADevolver)
		this.checkVegano(condicionesADevolver)
		condicionesADevolver
	}

	def checkVegano(List<Condicion> condiciones) {
		// Si algun ingrediente no se recomienda para Veganos, agrega vegano a las condiciones para las cuales no se recomienda
		if (ingredientes.exists[soyCarne]){
			condiciones.add(new CondicionVegano)
		}
	}

	def checkHipertenso(List<Condicion> condicions) {
		//Si algun condimento no se recomienda para hipertensos, agrega hipertension a las condiciones para las cuales no se recomienda
		if (condimentos.exists[noRecomendableParaHipertensos]) {
			condicions.add(new CondicionHipertension)
		}
	}

	def checkDiabetico(List<Condicion> condicions) {
		//Si algun condimento no se recomienda para diabeticos, agrega diabetes a las condiciones para las cuales no se recomienda
		if (condimentos.exists[noRecomendableParaDiabeticos]) {
			condicions.add(new CondicionDiabetes)
		}
	}

	def agregarSubreceta(Receta unaSubreceta) {
		subRecetas.add(unaSubreceta)
	}

	def cambiarNombre(String nombre) {
		nombreDeLaReceta = nombre
	}

	def devolverNombre() {
		nombreDeLaReceta
	}

}