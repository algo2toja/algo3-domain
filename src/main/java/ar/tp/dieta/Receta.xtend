package ar.tp.dieta

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class Receta extends ElementoDeReceta implements Cloneable{

	List<Ingrediente> ingredientes = new ArrayList<Ingrediente>
	List<Condimento> condimentos = new ArrayList<Condimento>
	String autor
	String nombreDeLaReceta
	double calorias
//	List<ElementoDeReceta> elementosDeReceta = new ArrayList<ElementoDeReceta> //Integra ingredientes, condimentos y subrecetas.	
	String procesoDePreparacion
	String dificultadDePreparacion
	String temporadaALaQueCorresponde
	int tiempoPreparacion
	int añoDeCreacion
//	List<String> condicionesPreexistentes = new ArrayList<String> SE CALCULA SOLO CON EL GET

	def void agregarIngrediente(Ingrediente unIngrediente){
		elementosDeReceta.add(unIngrediente)
		ingredientes.add(unIngrediente)
	}

	def void agregarCondimento(Condimento unCondimento) {
		elementosDeReceta.add(unCondimento)
		condimentos.add(unCondimento)
	}

	def void removerIngrediente(Ingrediente unIngrediente) {
		elementosDeReceta.remove(unIngrediente)
		ingredientes.remove(unIngrediente)
	}

	def void removerCondimento(Condimento unCondimento) {
		elementosDeReceta.remove(unCondimento)
		condimentos.remove(unCondimento)
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
		!elementosDeReceta.exists[ elemento | elemento.soyInadecuadoParaCondicion(unaCondicion)]
	}
	
	def exesoDeCalorias() {
		calorias > 500
	}
	
	def esInadecuadaParaGrupo(Grupo grupo) {
		grupo.miembros.exists[miembro | this.esInadecuadaParaUsuario(miembro)]
	}
	
	def boolean contieneIngrediente(String nombreIngrediente) {
		elementosDeReceta.exists[elem | elem.getNombre.equals(nombreIngrediente)]
	}
	
	def boolean contieneAlguno(List<String> nombresIngredientes) {
		nombresIngredientes.exists[nombreIngrediente | this.contieneIngrediente(nombreIngrediente)]
	}
	
	def ingredientesAString(){
		var List<String> stringsList = new ArrayList<String>();
		for(ElementoDeReceta elemento : elementosDeReceta){
			stringsList.add(elemento.nombre)
		}				
		stringsList.toString()
	}
	
	def boolean tuNombreEsEste(String nombre){
		nombreDeLaReceta.equals(nombre)
	}
	
	def void soyAptaParaVeganos(List <String> condicionesPreexistentes){
		if(soyInadecuadoParaCondicion(new CondicionVegano)){
			condicionesPreexistentes.add("Vegano")
		}
	}
	
	def void soyAptaParaDiabeticos(List <String>  condicionesPreexistentes){
		if(soyInadecuadoParaCondicion(new CondicionDiabetes)){
			condicionesPreexistentes.add("Diabetico")
		}
	}
	
	def void soyAptaParaHipertensos(List <String>  condicionesPreexistentes){
		if(soyInadecuadoParaCondicion(new CondicionHipertension)){
			condicionesPreexistentes.add("Hipertenso")
		}
	}
	
	def void soyAptaParaCeliacos(List <String>  condicionesPreexistentes){
		if(soyInadecuadoParaCondicion(new CondicionCeliaco)){
			condicionesPreexistentes.add("Celiaco")
		}
	}
	
	def getCondicionesPreexistentes() {
		var condiciones = new ArrayList<String>
		soyAptaParaVeganos(condiciones)
		soyAptaParaHipertensos(condiciones)
		soyAptaParaCeliacos(condiciones)
		soyAptaParaDiabeticos(condiciones)
		condiciones
	}
	
	def Receta devolverme(){
		this
	}
	
	def List<ElementoDeReceta> getElementosDeReceta() {
		var elementosDeReceta = new ArrayList<ElementoDeReceta>
		elementosDeReceta.addAll(ingredientes)
		elementosDeReceta.addAll(condimentos)
		elementosDeReceta
	}
}