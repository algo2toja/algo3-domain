package ar.tp.dieta

import java.util.ArrayList
import java.util.GregorianCalendar
import java.util.Iterator
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

//ENTREGA 1
@Accessors
class Usuario {
	Double peso
	Double altura
	GregorianCalendar fechaDeNacimiento
	GregorianCalendar diaDeHoy
	String sexo
	String nombre
	Rutina rutina
	List<Condicion> condicionesPreexistentes = new ArrayList<Condicion>
	List<String> preferencias = new ArrayList<String>
	List<String> comidasQueNoMeGustan = new ArrayList<String>
	List<Receta> misRecetas = new ArrayList<Receta>
	List<Grupo> misGrupos = new ArrayList<Grupo>
	List<Receta> recetasFavoritas = new ArrayList<Receta>
	Filtro filtro
	RecetarioPublico recetario = new RecetarioPublico
	
	// Punto 1 y 2 validacion usuario
	public def validacionUsuario() {
		(this.validarCampos() && this.condicionesValidas())
	}
	
	// Metodo de validacion final
	protected def validarCampos() {
		((this.validarNombre) && (this.validarPeso) && (this.validarAltura) && (this.validarRutina) && (this.validarFechaDeNacimiento))
	}

	protected def boolean validarRutina() {
		!(rutina.equals(null))
	}

	protected def boolean validarNombre(){
		!(nombre.equals(null) && (nombre.length<=4))
	//Probar solo con funcion length
	}

	protected def boolean validarPeso() {
		!peso.equals(0)
	}

	protected def boolean validarAltura() {
		!altura.equals(0)
	}

	protected def validarFechaDeNacimiento() {
		!((fechaDeNacimiento.equals(null)) && (0 <= fechaDeNacimiento.compareTo(this.getDiaDeHoy)))
	}

	public def setFechaDeNacimiento(int ano, int mes, int diaDelMes) {
		fechaDeNacimiento = new GregorianCalendar(ano, mes, diaDelMes)
	}

	protected def getDiaDeHoy() {
		// Seteo el dia de la fecha en el momento que se pide validar, y devuelvo el dia de la fecha
		// diaDeHoy = new GregorianCalendar(Calendar.YEAR, Calendar.MONTH, Calendar.DAY_OF_MONTH)
		diaDeHoy = new GregorianCalendar()
	}

	// Calcular indice de masa corporal
	public def indiceDeMasaCorporal() {
		peso / (Math.pow(altura, 2))
	}
	
	protected def validarIMC() {
		(18 >= this.indiceDeMasaCorporal) && (this.indiceDeMasaCorporal <= 30)
	}

	public def boolean sigoUnaRutinaSaludable(){
		rutina.rutinaSaludable(this)
	} 
	
	//Agregar condiciones preexistentes
	public def void agregarCondicion(Condicion unaCondicion) {
		condicionesPreexistentes.add(unaCondicion)
	}

	public def void agregarPreferencia(String unaComida) {
		preferencias.add(unaComida)
	}

	public def void agregarComidaQueMeDisgusta(String unaComida) {
		comidasQueNoMeGustan.add(unaComida)
	}

	protected def subsanaTodasLasCondiciones() {
		// T o F. Segun si las condiciones preexistentes estan subsanadas.
		(condicionesPreexistentes.exists[ condicion | !condicion.seSubsana(this)])			
	}

	// Punto 3 usuario validacion usuario
	protected def boolean condicionesValidas(){
		!(condicionesPreexistentes.exists[condicion | condicion.validarCondicion(this).equals(false)])
	}

	protected def rutinaEsIntensiva() {
		rutina.rutinaEsIntensiva
	}

	protected def rutinaEsActiva() {
		rutina.rutinaEsActiva
	}
	
	protected def boolean meGustaLaCarne(){
		preferencias.contains("carne")
	}
	
	protected def boolean meGustaLaFruta(){
		preferencias.contains("fruta")
	}
	
	//Copiar una recetaPublica a la coleccion de recetas del usuario
	public def void agregarRecetaPublicaAMiColeccion(String nombreReceta) {
		var Receta recetaNueva = new Receta
		misRecetas.add(recetario.copiarReceta(recetaNueva, nombreReceta))
	}

	public def void agregarRecetaDeGrupo(Grupo unGrupo, String nombreReceta){
		var Receta recetaNueva = new Receta
		misRecetas.add(unGrupo.copiarReceta(this, unGrupo, recetaNueva,nombreReceta))
		
	}
		

	// Crear una receta privada
	public def void crearReceta(String nombre, double calorias, String proceso, String dificultad, String temporada) {
		var Receta nuevaReceta

		nuevaReceta = new Receta => [
			cambiarNombre(nombre)
			setCalorias(calorias)
			setProcesoDePreparacion(proceso)
			setDificultadDePreparacion(dificultad)
			setTemporadaALaQueCorresponde(temporada)
		]

		misRecetas.add(nuevaReceta)
	}

	// Devuelve una receta buscandola por su nombre.
	public def devolverReceta(String nombre) {// tambien buscar sobre las que puede ver
		var Receta receta = misRecetas.findFirst[receta|receta.devolverNombre.equals(nombre)]
		if (receta.equals(null)) {
			throw new BusinessException("No existe la receta en la lista de recetas.")
		}
		receta
	}
	
	//Devuelve una subreceta
	public def devolverSubReceta(String nombreReceta,String nombreSubreceta){
		var ElementoDeReceta subReceta = devolverReceta(nombreReceta).elementosDeReceta.findFirst[subReceta | subReceta.getNombre.equals(nombreSubreceta)] 
		if(subReceta.equals(null)){
			throw new BusinessException("No existe la subreceta en la lista de subrecetas.")
		}
		subReceta
	}

	// Modificacion de receta.
	public def void modificarReceta(String nombreOriginal, String nombreNuevo, int calorias, String proceso,
		String dificultad, String temporada) {
	
		var Receta nuevaReceta = new Receta
		nuevaReceta = devolverReceta(nombreOriginal) //nuevaReceta ahora apunta a la receta buscada (si es que existe)
		
		nuevaReceta =>[
			setProcesoDePreparacion(proceso)
			setCalorias(calorias)
			setDificultadDePreparacion(dificultad)
			setTemporadaALaQueCorresponde(temporada)
			cambiarNombre(nombreNuevo)
		]
	}
	
	def boolean meConvieneReceta(Receta receta) {
		receta.esInadecuadaParaUsuario(this) 
	}
	
						////////////////////////RECETA FAVORITA//////////////////////////////
	def void agregarRecetaFavoritaDeRecetario(String nombre, RecetarioPublico recetario){
		recetasFavoritas.add(recetario.busquedaReceta(nombre))
	}
	
	def void agregarRecetaFavoritaDeGrupo(Grupo unGrupo, String nombre){
		recetasFavoritas.add(unGrupo.devolverRecetaDeMiembro(nombre))
	}

						//////////////////////RECETAS QUE PUEDO VER//////////////////////////
	protected def List<Receta> recetasQuePuedoVer(){
		val List<Receta> recetasQueVeo = new ArrayList<Receta>
		
		
		recetario.recetas.forEach[receta | recetasQueVeo.add(receta)]//esta probada
		
		misGrupos.forEach[grupo | recetasQueVeo.addAll[grupo.recetasDelGrupoPara(this).iterator]]
		
		recetasQueVeo.addAll[misRecetas.iterator]
		recetasQueVeo
	}

	def List<Receta> busquedaFiltrada(){
		var List<Receta> recetasFiltradas = recetasQuePuedoVer()
			
		recetasFiltradas = filtro.aplicarFiltro(this)
	}
	
	def tePuedoSugerirEstaReceta(Receta receta){
		!(receta.esInadecuadaParaUsuario(this)) && !noMeGustaEstaReceta(receta)
		
	}
	
	def noMeGustaEstaReceta(Receta receta){
		(comidasQueNoMeGustan.exists[ingrediente | receta.elementosDeReceta.exists(elem | elem.getNombre.equals(ingrediente))])
	}
	
	def tieneSobrepeso() {
		indiceDeMasaCorporal >= 30
	}

}