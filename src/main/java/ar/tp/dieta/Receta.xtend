package ar.tp.dieta

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList

@Accessors
class Receta {

	String nombreDeLaReceta
	double calorias
	List<Comida> ingredientes = new ArrayList<Comida>()
	List<Comida> condimentos = new ArrayList<Comida>()
	String procesoDePreparacion
	String dificultadDePreparacion
	String temporadaALaQueCorresponde
	List<Receta> subRecetas = new ArrayList<Receta>()

	def void agregarIngrediente(Comida unaComida) {
		ingredientes.add(unaComida)
	}

	def void agregarCondimento(Comida unCondimento) {
		condimentos.add(unCondimento)
	}

	def void removerIngrediente(Comida unaComida) {
		ingredientes.remove(unaComida)
	}

	def void removerCondimento(Comida unCondimento) {
		condimentos.remove(unCondimento)
	}

	def validar() {
		this.validarCalorias && !ingredientes.empty
	}

	def validarCalorias() {
		10 >= this.getCalorias && this.getCalorias <= 5000
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

	def checkVegano(List<Condicion> condicions) {
		// si algun ingrediente o condimento no se recomienda para Veganos, agrega vegano a las condiciones para
		// las cuales no se recomienda
		if (ingredientes.exists[noRecomendableParaVeganos] || condimentos.exists[noRecomendableParaVeganos]) {
			condicions.add(new CondicionVegano)
		}
	}

	def checkHipertenso(List<Condicion> condicions) {
		// si algun ingrediente o condimento no se recomienda para hipertensos, agrega hipertension a las condiciones para
		// las cuales no se recomienda
		if (ingredientes.exists[noRecomendableParaHipertensos] || condimentos.exists[noRecomendableParaHipertensos]) {
			condicions.add(new CondicionHipertension)
		}
	}

	def checkDiabetico(List<Condicion> condicions) {
		// si algun ingrediente o condimento no se recomienda para diabeticos, agrega diabetes a las condiciones para
		// las cuales no se recomienda
		if (ingredientes.exists[noRecomendableParaDiabeticos] || condimentos.exists[noRecomendableParaDiabeticos]) {
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