package ar.tp.dieta

import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Receta extends ElementoDeReceta implements Cloneable {

	String nombreDeLaReceta
	double calorias //Tiene que ser sumatoria de ingredientes/condimentos
	ArrayList<ElementoDeReceta> elementosDeReceta = new ArrayList<ElementoDeReceta> //Integra ingredientes, condimentos y subrecetas.	
	String procesoDePreparacion
	String dificultadDePreparacion
	String temporadaALaQueCorresponde

	def void agregarIngrediente(Ingrediente unIngrediente){
		elementosDeReceta.add(unIngrediente)
	}

	def void agregarCondimento(Ingrediente unCondimento) {
		elementosDeReceta.add(unCondimento)
	}

	def void removerIngrediente(Ingrediente unIngrediente) {
		elementosDeReceta.remove(unIngrediente)
	}

	def void removerCondimento(Ingrediente unCondimento) {
		elementosDeReceta.remove(unCondimento)
	}

	def validar(){
		this.validarCalorias && !elementosDeReceta.empty
	}

	def validarCalorias() {
		//Devuelve T o F segun la receta tenga las calorias necesarias o no
		(10 >= this.getCalorias && this.getCalorias <= 5000)
	}
	
	public def boolean inadecuadaParaCondiciones(Condicion unaCondicion){
		//Para cada condicion de la receta, que chequee si cada uno de los elementos de la receta es conveniente o no.
		elementosDeReceta.exists[ elemento | elemento.soyInadecuadoParaCondicion(unaCondicion) ]
	}
	
	public def boolean esInadecuadaParaUsuario(Usuario unUsuario) {
		//Para cada condicion del usuario, llamo al método para ver si es inadecuada la receta.
		unUsuario.condicionesPreexistentes.exists[ condicion | this.soyInadecuadoParaCondicion(condicion)]
	}

	def agregarSubreceta(Receta unaSubreceta) {
		 elementosDeReceta.add(unaSubreceta)
	}

	def cambiarNombre(String nombre) {
		setNombreDeLaReceta(nombre)
	}

	def devolverNombre() {
		getNombreDeLaReceta()
	}
	
	override soyInadecuadoParaCondicion(Condicion unaCondicion) {
		elementosDeReceta.exists[ elemento | elemento.soyInadecuadoParaCondicion(unaCondicion)]
	}
	
	def exesoDeCalorias() {
		calorias > 500
	}
	
	def esInadecuadaParaGrupo(Grupo grupo) {
		grupo.miembros.exists[miembro | this.esInadecuadaParaUsuario(miembro)]
	}

}