package ar.tp.dieta

import java.util.ArrayList
import java.util.GregorianCalendar
import java.util.Iterator
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import queComemos.entrega3.dominio.Dificultad
import queComemos.entrega3.repositorio.BusquedaRecetas
import queComemos.entrega3.repositorio.RepoRecetas

//ENTREGA 1
@Accessors
class Usuario extends Miembro {
	Double peso
	Double altura
	GregorianCalendar fechaDeNacimiento
	GregorianCalendar diaDeHoy
	String sexo
	Rutina rutina
	List<Condicion> condicionesPreexistentes = new ArrayList<Condicion>
	List<String> comidasQueNoMeGustan = new ArrayList<String>
	List<Receta> misRecetas = new ArrayList<Receta>
	List<Grupo> misGrupos = new ArrayList<Grupo>
	List<String> recetasFavoritas = new ArrayList<String>
	BusquedaRecetas busqueda = new BusquedaRecetas
	List<ConsultaObserver> observadores = new ArrayList<ConsultaObserver>
	List<Accion> acciones = new ArrayList<Accion>
	String direccionCorreo
	Boolean resultadoDeConsultasAFavoritos = false
	
	public def setFechaDeNacimiento(int ano, int mes, int diaDelMes) {
		fechaDeNacimiento = new GregorianCalendar(ano, mes, diaDelMes)
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
		var Receta receta = misRecetas.findFirst[receta | receta.devolverNombre.equals(nombre)]
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
	
	def void agregarRecetaFavorita(String nombre){
		if(!recetasFavoritas.contains(nombre)){
			recetasFavoritas.add(nombre)
		}
	}
	
	def void agregarRecetaFavorita(Grupo unGrupo, String nombre){
		recetasFavoritas.add(unGrupo.devolverRecetaDeMiembro(nombre).getNombreDeLaReceta)
	}

	def void agregarResultadosDeConsultasAFavoritos(){
		resultadoDeConsultasAFavoritos = true
	}
	
	def void noAgregarResultadosDeConsultasAFavoritos(){
		resultadoDeConsultasAFavoritos = false
	}
	
	def boolean contenesEstaRecetaEnFavs(String nombreReceta){
		recetasFavoritas.contains(nombreReceta)
	}

	def List<Receta> recetasQuePuedoVer(){
		val List<Receta> recetasQueVeo = new ArrayList<Receta>
		recetario.recetas.forEach[receta | recetasQueVeo.add(receta)]
		misGrupos.forEach[grupo | recetasQueVeo.addAll[grupo.recetasDelGrupoPara(this).iterator]]
		recetasQueVeo.addAll[misRecetas.iterator]
		recetasQueVeo
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
	
	def boolean tenesEstaCondicion(Condicion unaCondicion){
		//Si existe un objeto de la misma clase que alguna de las condiciones en la coleccion condicionesPreexistentes, devuelvo true.
		condicionesPreexistentes.exists[ condicion | condicion.getClass().equals(unaCondicion.getClass()) ]
	}
	
	///////////////////////////////  METODOS PARA OBTENER RECETAS JSON //////////////////////////////////////////
	
	public def getRecetas(RepoRecetas repo, String nombre){ 
 		busqueda.setNombre(nombre)
 		val List<String> nombresRecetas = (new JsonSimpleReader).parseJsonNombre(repo.getRecetas(busqueda))
 		observadores.forEach[it.actualizar(this, nombresRecetas, busqueda)]
 		acciones.forEach[it.execute(this, busqueda, nombresRecetas)]
		repo.getRecetas(busqueda)
 	}
 	
 	public def getRecetas(RepoRecetas repo, Dificultad dificultad){
 		busqueda.setDificultad(dificultad)
 		val List<String> nombresRecetas = (new JsonSimpleReader).parseJsonNombre(repo.getRecetas(busqueda))
 		observadores.forEach[it.actualizar(this, nombresRecetas, busqueda)]
 		acciones.forEach[it.execute(this, busqueda, nombresRecetas)]
		repo.getRecetas(busqueda)
 	}
 	
 	public def getRecetas(RepoRecetas repo, String nombre, Dificultad dificultad){
		busqueda => [
			setNombre(nombre)
			setDificultad(dificultad)
		]
		val List<String> nombresRecetas = (new JsonSimpleReader).parseJsonNombre(repo.getRecetas(busqueda))
 		observadores.forEach[it.actualizar(this, nombresRecetas, busqueda)]
 		acciones.forEach[it.execute(this, busqueda, nombresRecetas)]
		repo.getRecetas(busqueda)		
 	}
 	
 	public def getRecetas(RepoRecetas repo, String nombre, Dificultad dificultad, List<String> palabrasClave){
		busqueda => [
			setNombre(nombre)
			setDificultad(dificultad)
		]
		palabrasClave.forEach[ palabraClave | busqueda.agregarPalabraClave(palabraClave) ]
		val List<String> nombresRecetas = (new JsonSimpleReader).parseJsonNombre(repo.getRecetas(busqueda))
 		observadores.forEach[it.actualizar(this, nombresRecetas, busqueda)]
 		acciones.forEach[it.execute(this, busqueda, nombresRecetas)]
		repo.getRecetas(busqueda)
 	}
 	
 	///////////////////////////////////// METODO PARA FILTRAR BUSQUEDAS /////////////////////////////////////
 	
 	def List<Receta> busquedaFiltrada(){
		var List<Receta> recetasFiltradas = recetasQuePuedoVer()
	
		if(!misBusquedas.empty){
			var Iterator<Busqueda> iterBusqueda = misBusquedas.iterator()
	 		while(iterBusqueda.hasNext){
	   			recetasFiltradas = (iterBusqueda.next).aplicarBusquedaUsuario(this,recetasFiltradas)
			}
		}
		recetasFiltradas
	}
	
	public def void agregarAccion(Accion unaAccion) {
		acciones.add(unaAccion)
	}

}